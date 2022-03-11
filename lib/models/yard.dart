import 'dart:convert';

import 'package:flutter/foundation.dart';

class YardCarrier with ChangeNotifier {
  int carrierCapacity;
  int? carrierId;
  int id;

  YardCarrier({
    required this.carrierCapacity,
    this.carrierId,
    required this.id,
  });

  YardCarrier copyWith({
    int? carrierCapacity,
    int? carrierId,
    int? id,
  }) {
    return YardCarrier(
      carrierCapacity: carrierCapacity ?? this.carrierCapacity,
      carrierId: carrierId ?? this.carrierId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carrierCapacity': carrierCapacity,
      'carrierId': carrierId,
      'id': id,
    };
  }

  factory YardCarrier.fromMap(Map<String, dynamic> map) {
    return YardCarrier(
      carrierCapacity: map['carrierCapacity']?.toInt() ?? 0,
      carrierId: map['carrierId']?.toInt(),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory YardCarrier.fromJson(String source) => YardCarrier.fromMap(json.decode(source));

  @override
  String toString() => 'YardCarrier(carrierCapacity: $carrierCapacity, carrierId: $carrierId, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is YardCarrier &&
      other.carrierCapacity == carrierCapacity &&
      other.carrierId == carrierId &&
      other.id == id;
  }

  @override
  int get hashCode => carrierCapacity.hashCode ^ carrierId.hashCode ^ id.hashCode;
}

class Yard with ChangeNotifier {
  DateTime? createdAt;
  String name;
  int id;
  DateTime? lastModifiedAt;
  bool active;
  String createdBy;
  String? lastmodifiedBy;
  int maxCapacity;
  int organizationId;

  Yard({
    this.createdAt,
    required this.name,
    required this.id,
    this.lastModifiedAt,
    required this.active,
    required this.createdBy,
    this.lastmodifiedBy,
    required this.maxCapacity,
    required this.organizationId,
  });

  Yard copyWith({
    DateTime? createdAt,
    String? name,
    int? id,
    DateTime? lastModifiedAt,
    bool? active,
    String? createdBy,
    String? lastmodifiedBy,
    int? maxCapacity,
    int? organizationId,
  }) {
    return Yard(
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      id: id ?? this.id,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      active: active ?? this.active,
      createdBy: createdBy ?? this.createdBy,
      lastmodifiedBy: lastmodifiedBy ?? this.lastmodifiedBy,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      organizationId: organizationId ?? this.organizationId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'name': name,
      'id': id,
      'lastModifiedAt': lastModifiedAt?.millisecondsSinceEpoch,
      'active': active,
      'createdBy': createdBy,
      'lastmodifiedBy': lastmodifiedBy,
      'maxCapacity': maxCapacity,
      'organizationId': organizationId,
    };
  }

  factory Yard.fromMap(Map<String, dynamic> map) {
    return Yard(
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt']) : null,
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      lastModifiedAt: map['lastModifiedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['lastModifiedAt']) : null,
      active: map['active'] ?? false,
      createdBy: map['createdBy'] ?? '',
      lastmodifiedBy: map['lastmodifiedBy'],
      maxCapacity: map['maxCapacity']?.toInt() ?? 0,
      organizationId: map['organizationId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Yard.fromJson(String source) => Yard.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Yard(createdAt: $createdAt, name: $name, id: $id, lastModifiedAt: $lastModifiedAt, active: $active, createdBy: $createdBy, lastmodifiedBy: $lastmodifiedBy, maxCapacity: $maxCapacity, organizationId: $organizationId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Yard &&
      other.createdAt == createdAt &&
      other.name == name &&
      other.id == id &&
      other.lastModifiedAt == lastModifiedAt &&
      other.active == active &&
      other.createdBy == createdBy &&
      other.lastmodifiedBy == lastmodifiedBy &&
      other.maxCapacity == maxCapacity &&
      other.organizationId == organizationId;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
      name.hashCode ^
      id.hashCode ^
      lastModifiedAt.hashCode ^
      active.hashCode ^
      createdBy.hashCode ^
      lastmodifiedBy.hashCode ^
      maxCapacity.hashCode ^
      organizationId.hashCode;
  }
}
