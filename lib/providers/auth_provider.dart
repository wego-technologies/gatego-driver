import 'dart:async';
import 'dart:convert';

import 'providers.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
import 'accountProvider.dart';
import 'carrierProvider.dart';
import 'yardProvider.dart';*/

import '../utils/debug_mode.dart';

class AuthState {
  String? token;
  DateTime? expiryDate;
  String? userId;
  Timer? authTimer;
  Timer? refreshTimer;
  bool isAuthing;
  String? errorState;

  AuthState(
      {this.authTimer,
      this.expiryDate,
      this.refreshTimer,
      this.token,
      this.userId,
      this.isAuthing = false,
      this.errorState});

  AuthState copyWith(
      {String? token,
      DateTime? expiryDate,
      String? userId,
      Timer? authTimer,
      Timer? refreshTimer,
      bool? isAuthing,
      String? errorState}) {
    return AuthState(
      token: token ?? this.token,
      expiryDate: expiryDate ?? this.expiryDate,
      userId: userId ?? this.userId,
      authTimer: authTimer ?? this.authTimer,
      refreshTimer: refreshTimer ?? this.refreshTimer,
      isAuthing: isAuthing ?? this.isAuthing,
      errorState: errorState ?? this.errorState,
    );
  }
}

class Auth extends StateNotifier<AuthState> {
  Auth(this.ref) : super(AuthState());

  final Ref ref;

  bool get isAuth {
    return state.token != null;
  }

  String? get userId {
    return state.userId;
  }

  String? get token {
    if (state.expiryDate != null &&
        state.expiryDate!.isAfter(DateTime.now()) &&
        state.token != null) {
      return state.token;
    }
    return null;
  }

  Future<bool> tryAutoLogin() async {
    if (isAuth) {
      return true;
    }
    if (state.isAuthing) {
      return false;
    }

    state = state.copyWith(isAuthing: true);

    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("authInfo")) {
      state = state.copyWith(isAuthing: false);
      return false;
    }
    final extractedData =
        json.decode(prefs.getString("authInfo")!) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedData["expiryDate"]);
    if (expiryDate.isAfter(DateTime.now())) {
      // Get new token
      if (extractedData["username"] != null && extractedData["passw"] != null) {
        await _auth(extractedData["username"], extractedData["passw"]);
      } else {
        state = state.copyWith(isAuthing: false);
        return false;
      }
    } else {
      // Use current token
      state = state.copyWith(
        token: extractedData["token"],
        userId: extractedData["userId"],
        expiryDate: expiryDate,
      );
    }
    /*_token = extractedData["token"];
    _userId = extractedData["userId"];
    _expiryDate = expiryDate;
    notifyListeners();*/

    await ref.read(accountProvider.notifier).getMe();

    _autoLogout();
    _autoRefreshToken();

    state = state.copyWith(isAuthing: false);

    return true;
  }

  Future<void> _auth(username, passw) async {
    final url = DebugUtils().baseUrl + "auth/login";

    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode(
          {
            "username": username,
            "password": passw,
          },
        ),
      );

      if (res.statusCode == 200) {
        final resData = json.decode(res.body);

        var tempState = state;

        tempState = tempState.copyWith(
          token: resData["jwt_token"],
          userId: username,
          errorState: null,
        );

        if (tempState.token != null) {
          tempState = tempState.copyWith(
            expiryDate: JwtDecoder.getExpirationDate(tempState.token!),
          );

          state = tempState;

          _autoLogout();
          _autoRefreshToken();

          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            "token": tempState.token,
            "userId": state.userId,
            "expiryDate": state.expiryDate!.toIso8601String(),
            "username": username,
            "passw": passw,
          });

          prefs.setString("authInfo", userData);
        } else {
          throw "No token recieved";
        }
      } else {
        final resData = json.decode(res.body);
        throw (res.statusCode.toString() + ": " + resData["error_code"]);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> _refreshToken() async {
    final url = DebugUtils().baseUrl + "auth/refresh-token";

    if (token == null) {
      throw "Should be authenticated";
    }

    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer " + state.token!
        },
        body: json.encode(
          {"jwt_token": state.token},
        ),
      );

      if (res.statusCode == 200) {
        final resData = json.decode(res.body);

        if (resData["jwt_token"] == null) {
          throw "No token recieved";
        }

        state = state.copyWith(
          token: resData["jwt_token"],
          expiryDate: JwtDecoder.getExpirationDate(resData["jwt_token"]),
        );

        _autoLogout();
        _autoRefreshToken();

        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          "token": state.token,
          "userId": state.userId,
          "expiryDate": state.expiryDate?.toIso8601String(),
        });

        prefs.setString("authInfo", userData);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> signIn(String email, String passw) async {
    if ((email.isEmpty || passw.isEmpty || passw.length < 8) && !isAuth) {
      state = state.copyWith(
        errorState: "Password too short",
        isAuthing: false,
      );
      return false;
    }
    state = state.copyWith(isAuthing: true);
    try {
      await _auth(email, passw);
    } catch (e) {
      state = state.copyWith(isAuthing: false, errorState: e.toString());
      rethrow;
    }

    state = state.copyWith(isAuthing: false, errorState: null);
    return isAuth;
  }

  Future<void> logout() async {
    if (state.authTimer != null) {
      state.authTimer!.cancel();
    }
    if (state.refreshTimer != null) {
      state.refreshTimer!.cancel();
    }

    state = state.copyWith(token: null, expiryDate: null, userId: null);

    clearData();

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (state.authTimer != null) {
      state.authTimer!.cancel();
    }

    final _timeToExpiry =
        state.expiryDate!.difference(DateTime.now()).inSeconds;

    state = state.copyWith(
      authTimer: Timer(Duration(seconds: _timeToExpiry), logout),
    );
  }

  void _autoRefreshToken() {
    if (state.refreshTimer != null) {
      state.refreshTimer!.cancel();
    }
    final _timeToExpiry =
        state.expiryDate!.difference(DateTime.now()).inSeconds;
    state = state.copyWith(
      refreshTimer: Timer(Duration(seconds: _timeToExpiry - 30), _tryReferesh),
    );
  }

  void _tryReferesh() {
    _refreshToken();
  }

  void clearData() {
    Future.delayed(const Duration(milliseconds: 0), () {
      ref.read(accountProvider.notifier).clear();
      ref.read(locationProvider.notifier).stopAndDispose(clear: true);
      /*Provider.of<CarrierProvider>(context, listen: false).clear();
      Provider.of<YardProvider>(context, listen: false).clear();
      Provider.of<SummaryProvider>(context, listen: false).clear();*/
    });
  }
}
