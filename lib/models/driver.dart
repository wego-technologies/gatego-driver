import 'dart:convert';

import 'package:flutter/foundation.dart';

class Driver with ChangeNotifier {
  String license;
  String licensePictureId;
  String truckNumber;

  Driver({
    required this.license,
    required this.licensePictureId,
    required this.truckNumber
  });

  Driver copyWith({
    String? license,
    String? licensePictureId,
    String? truckNumber,
  }) {
    return Driver(
      license: license ?? this.license,
      licensePictureId: licensePictureId ?? this.licensePictureId,
      truckNumber: truckNumber ?? this.truckNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'license': license,
      'licensePictureId': licensePictureId,
      'truckNumber': truckNumber,
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      license: map['license'] ?? '',
      licensePictureId: map['licensePictureId'] ?? '',
      truckNumber: map['truckNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Driver.fromJson(String source) => Driver.fromMap(json.decode(source));

  @override
  String toString() => 'Driver(license: $license, licensePictureId: $licensePictureId, truckNumber: $truckNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Driver &&
      other.license == license &&
      other.licensePictureId == licensePictureId &&
      other.truckNumber == truckNumber;
  }

  @override
  int get hashCode => license.hashCode ^ licensePictureId.hashCode ^ truckNumber.hashCode;
}
