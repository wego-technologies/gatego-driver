import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../utils/string_to_role.dart';

import '../models/carrier.dart';
import '../models/organization.dart';
import '../models/roles.dart';
import 'driver.dart';

class Account with ChangeNotifier {
  bool active;
  List<dynamic>? canViewCarrierIds;
  Carrier? carrier;
  DateTime? deletedAt;
  Driver? driver;
  String? email;
  int id;
  String name;
  Organization organization;
  String? phoneNumber;
  Role role;
  double? yardId;

  Account({
    required this.active,
    this.canViewCarrierIds,
    this.carrier,
    this.deletedAt,
    this.driver,
    this.email,
    required this.id,
    required this.name,
    required this.organization,
    this.phoneNumber,
    required this.role,
    this.yardId,
  });

  Account copyWith({
    bool? active,
    List<dynamic>? canViewCarrierIds,
    Carrier? carrier,
    DateTime? deletedAt,
    Driver? driver,
    String? email,
    int? id,
    String? name,
    Organization? organization,
    String? phoneNumber,
    Role? role,
    double? yardId,
  }) {
    return Account(
      active: active ?? this.active,
      canViewCarrierIds: canViewCarrierIds ?? this.canViewCarrierIds,
      carrier: carrier ?? this.carrier,
      deletedAt: deletedAt ?? this.deletedAt,
      driver: driver ?? this.driver,
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      organization: organization ?? this.organization,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      yardId: yardId ?? this.yardId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'canViewCarrierIds': canViewCarrierIds,
      'carrier': carrier?.toMap(),
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'driver': driver?.toMap(),
      'email': email,
      'id': id,
      'name': name,
      'organization': organization.toMap(),
      'phoneNumber': phoneNumber,
      'role': role.name,
      'yardId': yardId,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      active: map['active'] ?? false,
      canViewCarrierIds: List<dynamic>.from(map['canViewCarrierIds']),
      carrier: map['carrier'] != null ? Carrier.fromMap(map['carrier']) : null,
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'])
          : null,
      driver: map['driver'] != null ? Driver.fromMap(map['driver']) : null,
      email: map['email'],
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      organization: Organization.fromMap(map['organization']),
      phoneNumber: map['phoneNumber'],
      role: stringToRole(map['role']),
      yardId: map['yardId']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Account(active: $active, canViewCarrierIds: $canViewCarrierIds, carrier: $carrier, deletedAt: $deletedAt, driver: $driver, email: $email, id: $id, name: $name, organization: $organization, phoneNumber: $phoneNumber, role: $role, yardId: $yardId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.active == active &&
        listEquals(other.canViewCarrierIds, canViewCarrierIds) &&
        other.carrier == carrier &&
        other.deletedAt == deletedAt &&
        other.driver == driver &&
        other.email == email &&
        other.id == id &&
        other.name == name &&
        other.organization == organization &&
        other.phoneNumber == phoneNumber &&
        other.role == role &&
        other.yardId == yardId;
  }

  @override
  int get hashCode {
    return active.hashCode ^
        canViewCarrierIds.hashCode ^
        carrier.hashCode ^
        deletedAt.hashCode ^
        driver.hashCode ^
        email.hashCode ^
        id.hashCode ^
        name.hashCode ^
        organization.hashCode ^
        phoneNumber.hashCode ^
        role.hashCode ^
        yardId.hashCode;
  }
}
