import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
import 'accountProvider.dart';
import 'carrierProvider.dart';
import 'yardProvider.dart';*/

import '../utils/debug_mode.dart';

class Auth with ChangeNotifier {
  Auth(this.ref) : super();

  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTimer;
  Timer? _refreshTimer;

  final Ref ref;

  bool get isAuth {
    return token != null;
  }

  String? get userId {
    return _userId;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<bool> tryAutoLogin() async {
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
    _token = extractedData["token"];
    _userId = extractedData["userId"];
    _expiryDate = expiryDate;
    notifyListeners();
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

        _token = resData["jwt_token"];

        _userId = username;

        if (_token != null) {
          _expiryDate = JwtDecoder.getExpirationDate(_token!);

          _autoLogout();
          _autoRefreshToken();

          notifyListeners();

          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            "token": _token,
            "userId": _userId,
            "expiryDate": JwtDecoder.getExpirationDate(_token!),
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
          "Authorization": "Bearer " + _token!
        },
        body: json.encode(
          {"jwt_token": _token},
        ),
      );

      if (res.statusCode == 200) {
        final resData = json.decode(res.body);

        _token = resData["jwt_token"];

        if (token == null) {
          throw "No token recieved";
        }

        _expiryDate = JwtDecoder.getExpirationDate(_token!);

        _autoLogout();
        _autoRefreshToken();

        notifyListeners();

        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          "token": _token,
          "userId": _userId,
          "expiryDate": JwtDecoder.getExpirationDate(_token!),
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
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    if (_refreshTimer != null) {
      _refreshTimer!.cancel();
    }

    //clearData();

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }

    final _timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: _timeToExpiry), logout);
  }

  void _autoRefreshToken() {
    if (_refreshTimer != null) {
      _refreshTimer!.cancel();
    }
    final _timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _refreshTimer = Timer(Duration(seconds: _timeToExpiry - 30), _tryReferesh);
  }

  void _tryReferesh() {
    _refreshToken();
  }

  /*void clearData(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      ref.read(AccountProvider).clear();
      Provider.of<CarrierProvider>(context, listen: false).clear();
      Provider.of<YardProvider>(context, listen: false).clear();
      Provider.of<SummaryProvider>(context, listen: false).clear();
    });
  }*/
}
