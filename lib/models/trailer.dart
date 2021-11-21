import 'package:flutter/foundation.dart';

class Trailer with ChangeNotifier {
  int id;
  String? status;
  String? direction;
  int? yardId;
  String? yardName;
  String? truckNumber;
  int? truckCarrierId;
  String? truckCarrierName;
  String? otherTruckCarrier;
  String? otherTrailerCarrier;
  String? truckType;
  int? vehicleImageId;
  int? tuckImageId;
  int? leftTrailerImageId;
  int? rightTrailerImageId;
  String? purpouse;
  String? trialer;
  int? trailerCarrierId;
  String? trailerCarrierName;
  String? trailerClient;
  String? trailerPriority;
  int? insideTrailerPictureId;
  int? driverId;
  String? driverName;
  String? load;
  String? seal;
  String? destination;
  int? damageId;
  String? damage;
  String? damageReference;
  String? damageStatus;
  String? comments;
  DateTime? movementTimestamp;
  int? ageDays;
  List<int>? attachmentIds;
  List<int>? attachmentPictureIds;
  List<int>? sealPictureIds;
  List<int>? damagePictureIds;
  List<int>? damageAttachmentIds;

  Trailer({
    this.ageDays,
    this.attachmentIds,
    this.attachmentPictureIds,
    this.comments,
    this.damage,
    this.damageAttachmentIds,
    this.damageId,
    this.damagePictureIds,
    this.damageReference,
    this.damageStatus,
    this.destination,
    this.direction,
    this.driverId,
    this.driverName,
    required this.id,
    this.insideTrailerPictureId,
    this.leftTrailerImageId,
    this.load,
    this.movementTimestamp,
    this.otherTrailerCarrier,
    this.otherTruckCarrier,
    this.purpouse,
    this.rightTrailerImageId,
    this.seal,
    this.sealPictureIds,
    this.status,
    this.trailerCarrierId,
    this.trailerCarrierName,
    this.trailerClient,
    this.trailerPriority,
    this.trialer,
    this.truckCarrierId,
    this.truckCarrierName,
    this.truckNumber,
    this.truckType,
    this.tuckImageId,
    this.vehicleImageId,
    this.yardId,
    this.yardName,
  });
}
