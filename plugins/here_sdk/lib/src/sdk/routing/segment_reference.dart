// Copyright (c) 2018-2021 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/travel_direction.dart';
import 'package:meta/meta.dart';


/// Reference to a segment id with a travel direction.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class SegmentReference {
  /// Topology segment id representing a unique identifier within the HERE platform catalogs.
  String segmentId;

  /// Travel direction of the segment.
  TravelDirection travelDirection;

  /// Start offset of the segment.
  /// @nodoc
  @internal
  double internaloffsetStart;

  /// End offset of the segment.
  /// @nodoc
  @internal
  double internaloffsetEnd;

  /// Here tile partition id (Morton-encoding + level indicator) of the segment.
  /// @nodoc
  @internal
  int internaltilePartitionId;

  SegmentReference([String segmentId = "", TravelDirection travelDirection = TravelDirection.bidirectional, double offsetStart = 0.0, double offsetEnd = 1.0, int tilePartitionId = 0])
    : segmentId = segmentId, travelDirection = travelDirection, internaloffsetStart = offsetStart, internaloffsetEnd = offsetEnd, internaltilePartitionId = tilePartitionId;
  SegmentReference.withDefaults()
    : segmentId = "", travelDirection = TravelDirection.bidirectional, internaloffsetStart = 0.0, internaloffsetEnd = 1.0, internaltilePartitionId = 0;
  /// Returns an instance of this struct from a string if it's well-formatted, `null` otherwise.
  ///
  static SegmentReference? fromString(String segmentRef) => $prototype.fromString(segmentRef);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SegmentReference) return false;
    SegmentReference _other = other;
    return segmentId == _other.segmentId &&
        travelDirection == _other.travelDirection &&
        internaloffsetStart == _other.internaloffsetStart &&
        internaloffsetEnd == _other.internaloffsetEnd &&
        internaltilePartitionId == _other.internaltilePartitionId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + segmentId.hashCode;
    result = 31 * result + travelDirection.hashCode;
    result = 31 * result + internaloffsetStart.hashCode;
    result = 31 * result + internaloffsetEnd.hashCode;
    result = 31 * result + internaltilePartitionId.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SegmentReference$Impl();
}


// SegmentReference "private" section, not exported.

final _sdkRoutingSegmentreferenceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32, Double, Double, Uint32),
    Pointer<Void> Function(Pointer<Void>, int, double, double, int)
  >('here_sdk_sdk_routing_SegmentReference_create_handle'));
final _sdkRoutingSegmentreferenceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_release_handle'));
final _sdkRoutingSegmentreferenceGetFieldsegmentId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_segmentId'));
final _sdkRoutingSegmentreferenceGetFieldtravelDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_travelDirection'));
final _sdkRoutingSegmentreferenceGetFieldoffsetStart = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_offsetStart'));
final _sdkRoutingSegmentreferenceGetFieldoffsetEnd = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_offsetEnd'));
final _sdkRoutingSegmentreferenceGetFieldtilePartitionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_tilePartitionId'));



/// @nodoc
@visibleForTesting
class SegmentReference$Impl {
  SegmentReference? fromString(String segmentRef) {
    final _fromStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_SegmentReference_fromString__String'));
    final _segmentRefHandle = stringToFfi(segmentRef);
    final __resultHandle = _fromStringFfi(__lib.LibraryContext.isolateId, _segmentRefHandle);
    stringReleaseFfiHandle(_segmentRefHandle);
    try {
      return sdkRoutingSegmentreferenceFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingSegmentreferenceReleaseFfiHandleNullable(__resultHandle);

    }

  }

}

Pointer<Void> sdkRoutingSegmentreferenceToFfi(SegmentReference value) {
  final _segmentIdHandle = stringToFfi(value.segmentId);
  final _travelDirectionHandle = sdkRoutingTraveldirectionToFfi(value.travelDirection);
  final _offsetStartHandle = (value.internaloffsetStart);
  final _offsetEndHandle = (value.internaloffsetEnd);
  final _tilePartitionIdHandle = (value.internaltilePartitionId);
  final _result = _sdkRoutingSegmentreferenceCreateHandle(_segmentIdHandle, _travelDirectionHandle, _offsetStartHandle, _offsetEndHandle, _tilePartitionIdHandle);
  stringReleaseFfiHandle(_segmentIdHandle);
  sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
  
  
  
  return _result;
}

SegmentReference sdkRoutingSegmentreferenceFromFfi(Pointer<Void> handle) {
  final _segmentIdHandle = _sdkRoutingSegmentreferenceGetFieldsegmentId(handle);
  final _travelDirectionHandle = _sdkRoutingSegmentreferenceGetFieldtravelDirection(handle);
  final _offsetStartHandle = _sdkRoutingSegmentreferenceGetFieldoffsetStart(handle);
  final _offsetEndHandle = _sdkRoutingSegmentreferenceGetFieldoffsetEnd(handle);
  final _tilePartitionIdHandle = _sdkRoutingSegmentreferenceGetFieldtilePartitionId(handle);
  try {
    return SegmentReference(
      stringFromFfi(_segmentIdHandle), 
      sdkRoutingTraveldirectionFromFfi(_travelDirectionHandle), 
      (_offsetStartHandle), 
      (_offsetEndHandle), 
      (_tilePartitionIdHandle)
    );
  } finally {
    stringReleaseFfiHandle(_segmentIdHandle);
    sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
    
    
    
  }
}

void sdkRoutingSegmentreferenceReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingSegmentreferenceReleaseHandle(handle);

// Nullable SegmentReference

final _sdkRoutingSegmentreferenceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_create_handle_nullable'));
final _sdkRoutingSegmentreferenceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_release_handle_nullable'));
final _sdkRoutingSegmentreferenceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_value_nullable'));

Pointer<Void> sdkRoutingSegmentreferenceToFfiNullable(SegmentReference? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSegmentreferenceToFfi(value);
  final result = _sdkRoutingSegmentreferenceCreateHandleNullable(_handle);
  sdkRoutingSegmentreferenceReleaseFfiHandle(_handle);
  return result;
}

SegmentReference? sdkRoutingSegmentreferenceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSegmentreferenceGetValueNullable(handle);
  final result = sdkRoutingSegmentreferenceFromFfi(_handle);
  sdkRoutingSegmentreferenceReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSegmentreferenceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSegmentreferenceReleaseHandleNullable(handle);

// End of SegmentReference "private" section.

