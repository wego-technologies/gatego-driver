import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'yard.dart';

class Carrier with ChangeNotifier {
  DateTime createdAt;
  String createdBy;
  String fleetId;
  int id;
  DateTime lastModifiedAt;
  String lastModifiedBy;
  String name;
  String scac;
  List<YardCarrier> yards;

  Carrier({
    required this.createdAt,
    required this.createdBy,
    required this.fleetId,
    required this.id,
    required this.lastModifiedAt,
    required this.lastModifiedBy,
    required this.name,
    required this.scac,
    required this.yards,
  });

  Carrier copyWith({
    DateTime? createdAt,
    String? createdBy,
    String? fleetId,
    int? id,
    DateTime? lastModifiedAt,
    String? lastModifiedBy,
    String? name,
    String? scac,
    List<YardCarrier>? yards,
  }) {
    return Carrier(
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      fleetId: fleetId ?? this.fleetId,
      id: id ?? this.id,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
      name: name ?? this.name,
      scac: scac ?? this.scac,
      yards: yards ?? this.yards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt.millisecondsSinceEpoch,
      'createdBy': createdBy,
      'fleetId': fleetId,
      'id': id,
      'lastModifiedAt': lastModifiedAt.millisecondsSinceEpoch,
      'lastModifiedBy': lastModifiedBy,
      'name': name,
      'scac': scac,
      'yards': yards.map((x) => x.toMap()).toList(),
    };
  }

  factory Carrier.fromMap(Map<String, dynamic> map) {
    return Carrier(
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      createdBy: map['createdBy'] ?? '',
      fleetId: map['fleetId'] ?? '',
      id: map['id']?.toInt() ?? 0,
      lastModifiedAt:
          DateTime.fromMillisecondsSinceEpoch(map['lastModifiedAt']),
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      name: map['name'] ?? '',
      scac: map['scac'] ?? '',
      yards: List<YardCarrier>.from(
          map['yards']?.map((x) => YardCarrier.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Carrier.fromJson(String source) =>
      Carrier.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Carrier(createdAt: $createdAt, createdBy: $createdBy, fleetId: $fleetId, id: $id, lastModifiedAt: $lastModifiedAt, lastModifiedBy: $lastModifiedBy, name: $name, scac: $scac, yards: $yards)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Carrier &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy &&
        other.fleetId == fleetId &&
        other.id == id &&
        other.lastModifiedAt == lastModifiedAt &&
        other.lastModifiedBy == lastModifiedBy &&
        other.name == name &&
        other.scac == scac &&
        listEquals(other.yards, yards);
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        createdBy.hashCode ^
        fleetId.hashCode ^
        id.hashCode ^
        lastModifiedAt.hashCode ^
        lastModifiedBy.hashCode ^
        name.hashCode ^
        scac.hashCode ^
        yards.hashCode;
  }
}
