import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guard_app/providers/providers.dart';
import 'package:guard_app/utils/string_to_role.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'dart:async';

import '../models/account.dart';
import '../models/carrier.dart';
import '../models/driver.dart';
import '../models/organization.dart';
import '../utils/debug_mode.dart';

class AccountState {
  Account? account;

  AccountState(account);
}

class AccountProvider extends StateNotifier<AccountState> {
  AccountProvider(this.ref) : super(AccountState(null));
  final Ref ref;

  Future<Account?> getMe() async {
    final token = ref.read(authProvider).token;

    /*if (retryTimer != null) {
      retryTimer.cancel();
    }*/
    if (token != null || state.account == null) {
      final url = DebugUtils().baseUrl + "api/account/me";

      try {
        final res = await http.get(
          Uri.parse(url),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + token!,
          },
        );

        if (res.statusCode == 200) {
          final resData = json.decode(res.body);

          DateTime? _deletedAt;

          if (resData["deleted_at"] != null) {
            _deletedAt = DateTime.tryParse(resData["deleted_at"]);
          }

          // TODO: Some weirdness here

          state.account = Account(
            active: resData["active"],
            canViewCarrierIds: resData["can_view_carrier_ids"],
            role: stringToRole(resData["role"]),
            name: resData["name"],
            id: resData["id"],
            carrier: genCarrier(resData),
            deletedAt: _deletedAt,
            driver: genDriver(resData),
            email: resData["email"],
            organization: Organization.fromMap(resData["organization"]),
            phoneNumber: resData["phone_number"],
            yardId: resData["yard_id"],
          );
        }
        return state.account;
      } catch (e) {
        /*print("Trying to reconnet");
        retryTimer = Timer(
            Duration(
              seconds: 5,
            ), () {
          getMe();
        });*/
        rethrow;
      }
    }
  }

  get me {
    return state.account;
  }

  Carrier? genCarrier(data) {
    if (data["carrier"] != null) {
      Carrier(
        createdAt: data["carrier"]["created_at"],
        createdBy: data["carrier"]["created_by"],
        fleetId: data["carrier"]["fleet_id"],
        lastModifiedAt: data["carrier"]["last_modified_at"],
        lastModifiedBy: data["carrier"]["last_modified_by"],
        name: data["carrier"]["name"],
        scac: data["carrier"]["scac"],
        yards: data["carrier"]["yards"],
        id: data["carrier"]["id"],
      );
    }

    return null;
  }

  Driver? genDriver(data) {
    if (data["driver"] != null) {
      Driver(
        license: data["driver"]["license"],
        licensePictureId: data["driver"]["license_picture_id"],
        truckNumber: data["driver"]["truck_number"],
      );
    }

    return null;
  }

  Organization? genOrg(data) {
    if (data["organization"] != null) {
      Organization(
        id: data["organization"]["id"],
        name: data["organization"]["name"],
      );
    }

    return null;
  }

  void clear() {
    state.account = null;
  }
}
