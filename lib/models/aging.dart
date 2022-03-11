import 'dart:convert';

import 'package:flutter/foundation.dart';

class AgingInventory with ChangeNotifier {
  int id;
  int ageDays;
  String trailer;

  AgingInventory({
    required this.id,
    required this.ageDays,
    required this.trailer,
  });

  AgingInventory copyWith({
    int? id,
    int? ageDays,
    String? trailer,
  }) {
    return AgingInventory(
      id: id ?? this.id,
      ageDays: ageDays ?? this.ageDays,
      trailer: trailer ?? this.trailer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ageDays': ageDays,
      'trailer': trailer,
    };
  }

  factory AgingInventory.fromMap(Map<String, dynamic> map) {
    return AgingInventory(
      id: map['id']?.toInt() ?? 0,
      ageDays: map['ageDays']?.toInt() ?? 0,
      trailer: map['trailer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AgingInventory.fromJson(String source) => AgingInventory.fromMap(json.decode(source));

  @override
  String toString() => 'AgingInventory(id: $id, ageDays: $ageDays, trailer: $trailer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AgingInventory &&
      other.id == id &&
      other.ageDays == ageDays &&
      other.trailer == trailer;
  }

  @override
  int get hashCode => id.hashCode ^ ageDays.hashCode ^ trailer.hashCode;
}
