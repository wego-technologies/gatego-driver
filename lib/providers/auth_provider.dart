import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
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

  AuthState(
      {this.authTimer,
      this.expiryDate,
      this.refreshTimer,
      this.token,
      this.userId});

  AuthState copyWith({
    String? token,
    DateTime? expiryDate,
    String? userId,
    Timer? authTimer,
    Timer? refreshTimer,
  }) {
    return AuthState(
      token: token ?? this.token,
      expiryDate: expiryDate ?? this.expiryDate,
      userId: userId ?? this.userId,
      authTimer: authTimer ?? this.authTimer,
      refreshTimer: refreshTimer ?? this.refreshTimer,
    );
  }
}

class Auth extends StateNotifier<AuthState> {
  Auth(this.ref) : super(AuthState());

  final Ref ref;

  bool get isAuth {
    return token != null;
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
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("authInfo")) {
      return false;
    }
    final extractedData =
        json.decode(prefs.getString("authInfo")!) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedData["expiryDate"]);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    /*_token = extractedData["token"];
    _userId = extractedData["userId"];
    _expiryDate = expiryDate;
    notifyListeners();*/

    state = state.copyWith(
      token: extractedData["token"],
      userId: extractedData["userId"],
      expiryDate: expiryDate,
    );

    _autoLogout();
    _autoRefreshToken();
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
        );

        if (state.token != null) {
          tempState = tempState.copyWith(
            expiryDate: JwtDecoder.getExpirationDate(state.token!),
          );

          state = tempState;

          _autoLogout();
          _autoRefreshToken();

          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            "token": tempState.token,
            "userId": state.userId,
            "expiryDate": state.expiryDate!.toIso8601String(),
          });

          prefs.setString("authInfo", userData);
        } else {
          throw "No token recieved";
        }
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

        if (token == null) {
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
          "expiryDate": state.expiryDate,
        });

        prefs.setString("authInfo", userData);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> signIn(email, passw) async {
    await _auth(email, passw);
    return isAuth;
  }

  Future<void> logout() async {
    state = state.copyWith(token: null, expiryDate: null, userId: null);
    if (state.authTimer != null) {
      state.authTimer!.cancel();
    }
    if (state.refreshTimer != null) {
      state.refreshTimer!.cancel();
    }

    //clearData();

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

  void clearData(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 0), () {
      ref.read(accountProvider.notifier).clear();
      /*Provider.of<CarrierProvider>(context, listen: false).clear();
      Provider.of<YardProvider>(context, listen: false).clear();
      Provider.of<SummaryProvider>(context, listen: false).clear();*/
    });
  }
}
