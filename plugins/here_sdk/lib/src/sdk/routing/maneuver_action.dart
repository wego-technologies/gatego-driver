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

/// Maneuver action type.
enum ManeuverAction {
    /// Departure maneuver, such as "Start at".
    depart,
    /// Arrival maneuver, such as "Arrive at".
    arrive,
    /// Left-hand U-turn maneuver, such as "Make a U-turn at".
    leftUTurn,
    /// Sharp left turn maneuver, such as "Make a hard left turn onto".
    sharpLeftTurn,
    /// Left turn maneuver, such as "Turn left on".
    leftTurn,
    /// Slight left turn maneuver, such as "Bear left onto".
    slightLeftTurn,
    /// Continue maneuver, such as "Continue on".
    continueOn,
    /// Slight right turn maneuver, such as "Bear right onto".
    slightRightTurn,
    /// Right turn maneuver, such as "Turn right on".
    rightTurn,
    /// Sharp right turn maneuver, such as "Make a hard right turn onto".
    sharpRightTurn,
    /// Right u-turn maneuver, such as "Make a right U-turn at".
    rightUTurn,
    /// Left exit maneuver, such as "Take the left exit to".
    leftExit,
    /// Right exit maneuver, such as "Take the right exit to".
    rightExit,
    /// Left ramp maneuver, such as "Take the left ramp onto".
    leftRamp,
    /// Right ramp maneuver, such as "Take the right ramp onto".
    rightRamp,
    /// Left fork maneuver, such as "Take the left fork onto".
    leftFork,
    /// Middle fork maneuver, such as "Take the middle fork onto".
    middleFork,
    /// Right fork maneuver, such as "Take the right fork onto".
    rightFork,
    /// Ferry maneuver, such as "Take the ferry to".
    ferry,
    /// Roundabout maneuver (left-hand traffic), such as "Enter the roundabout".
    leftRoundaboutEnter,
    /// Roundabout maneuver (right-hand traffic), such as "Enter the roundabout".
    rightRoundaboutEnter,
    /// Roundabout maneuver (left-hand traffic), such as "Pass the roundabout".
    leftRoundaboutPass,
    /// Roundabout maneuver (right-hand traffic), such as "Pass the roundabout".
    rightRoundaboutPass,
    /// Roundabout maneuver (left-hand traffic), such as  "Take the first exit of the roundabout onto".
    leftRoundaboutExit1,
    /// Roundabout maneuver (left-hand traffic), such as "Take the second exit of the roundabout onto".
    leftRoundaboutExit2,
    /// Roundabout maneuver (left-hand traffic), such as "Take the third exit of the roundabout onto".
    leftRoundaboutExit3,
    /// Roundabout maneuver (left-hand traffic), such as "Take the fourth exit of the roundabout onto".
    leftRoundaboutExit4,
    /// Roundabout maneuver (left-hand traffic), such as "Take the fifth exit of the roundabout onto".
    leftRoundaboutExit5,
    /// Roundabout maneuver (left-hand traffic), such as "Take the sixth exit of the roundabout onto".
    leftRoundaboutExit6,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 7th exit of the roundabout onto".
    leftRoundaboutExit7,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 8th exit of the roundabout onto".
    leftRoundaboutExit8,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 9th exit of the roundabout onto".
    leftRoundaboutExit9,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 10th exit of the roundabout onto".
    leftRoundaboutExit10,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 11th exit of the roundabout onto".
    leftRoundaboutExit11,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 12th exit of the roundabout onto".
    leftRoundaboutExit12,
    /// Roundabout maneuver (right-hand traffic), such as "Take the first exit of the roundabout onto".
    rightRoundaboutExit1,
    /// Roundabout maneuver (right-hand traffic), such as "Take the second exit of the roundabout onto".
    rightRoundaboutExit2,
    /// Roundabout maneuver (right-hand traffic), such as "Take the third exit of the roundabout onto".
    rightRoundaboutExit3,
    /// Roundabout maneuver (right-hand traffic), such as "Take the fourth exit of the roundabout onto".
    rightRoundaboutExit4,
    /// Roundabout maneuver (right-hand traffic), such as "Take the fifth exit of the roundabout onto".
    rightRoundaboutExit5,
    /// Roundabout maneuver (right-hand traffic), such as "Take the sixth exit of the roundabout onto".
    rightRoundaboutExit6,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 7th exit of the roundabout onto".
    rightRoundaboutExit7,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 8th exit of the roundabout onto".
    rightRoundaboutExit8,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 9th exit of the roundabout onto".
    rightRoundaboutExit9,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 10th exit of the roundabout onto".
    rightRoundaboutExit10,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 11th exit of the roundabout onto".
    rightRoundaboutExit11,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 12th exit of the roundabout onto".
    rightRoundaboutExit12
}

// ManeuverAction "private" section, not exported.

int sdkRoutingManeuveractionToFfi(ManeuverAction value) {
  switch (value) {
  case ManeuverAction.depart:
    return 0;
  case ManeuverAction.arrive:
    return 1;
  case ManeuverAction.leftUTurn:
    return 2;
  case ManeuverAction.sharpLeftTurn:
    return 3;
  case ManeuverAction.leftTurn:
    return 4;
  case ManeuverAction.slightLeftTurn:
    return 5;
  case ManeuverAction.continueOn:
    return 6;
  case ManeuverAction.slightRightTurn:
    return 7;
  case ManeuverAction.rightTurn:
    return 8;
  case ManeuverAction.sharpRightTurn:
    return 9;
  case ManeuverAction.rightUTurn:
    return 10;
  case ManeuverAction.leftExit:
    return 11;
  case ManeuverAction.rightExit:
    return 12;
  case ManeuverAction.leftRamp:
    return 13;
  case ManeuverAction.rightRamp:
    return 14;
  case ManeuverAction.leftFork:
    return 15;
  case ManeuverAction.middleFork:
    return 16;
  case ManeuverAction.rightFork:
    return 17;
  case ManeuverAction.ferry:
    return 18;
  case ManeuverAction.leftRoundaboutEnter:
    return 19;
  case ManeuverAction.rightRoundaboutEnter:
    return 20;
  case ManeuverAction.leftRoundaboutPass:
    return 21;
  case ManeuverAction.rightRoundaboutPass:
    return 22;
  case ManeuverAction.leftRoundaboutExit1:
    return 23;
  case ManeuverAction.leftRoundaboutExit2:
    return 24;
  case ManeuverAction.leftRoundaboutExit3:
    return 25;
  case ManeuverAction.leftRoundaboutExit4:
    return 26;
  case ManeuverAction.leftRoundaboutExit5:
    return 27;
  case ManeuverAction.leftRoundaboutExit6:
    return 28;
  case ManeuverAction.leftRoundaboutExit7:
    return 29;
  case ManeuverAction.leftRoundaboutExit8:
    return 30;
  case ManeuverAction.leftRoundaboutExit9:
    return 31;
  case ManeuverAction.leftRoundaboutExit10:
    return 32;
  case ManeuverAction.leftRoundaboutExit11:
    return 33;
  case ManeuverAction.leftRoundaboutExit12:
    return 34;
  case ManeuverAction.rightRoundaboutExit1:
    return 35;
  case ManeuverAction.rightRoundaboutExit2:
    return 36;
  case ManeuverAction.rightRoundaboutExit3:
    return 37;
  case ManeuverAction.rightRoundaboutExit4:
    return 38;
  case ManeuverAction.rightRoundaboutExit5:
    return 39;
  case ManeuverAction.rightRoundaboutExit6:
    return 40;
  case ManeuverAction.rightRoundaboutExit7:
    return 41;
  case ManeuverAction.rightRoundaboutExit8:
    return 42;
  case ManeuverAction.rightRoundaboutExit9:
    return 43;
  case ManeuverAction.rightRoundaboutExit10:
    return 44;
  case ManeuverAction.rightRoundaboutExit11:
    return 45;
  case ManeuverAction.rightRoundaboutExit12:
    return 46;
  default:
    throw StateError("Invalid enum value $value for ManeuverAction enum.");
  }
}

ManeuverAction sdkRoutingManeuveractionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ManeuverAction.depart;
  case 1:
    return ManeuverAction.arrive;
  case 2:
    return ManeuverAction.leftUTurn;
  case 3:
    return ManeuverAction.sharpLeftTurn;
  case 4:
    return ManeuverAction.leftTurn;
  case 5:
    return ManeuverAction.slightLeftTurn;
  case 6:
    return ManeuverAction.continueOn;
  case 7:
    return ManeuverAction.slightRightTurn;
  case 8:
    return ManeuverAction.rightTurn;
  case 9:
    return ManeuverAction.sharpRightTurn;
  case 10:
    return ManeuverAction.rightUTurn;
  case 11:
    return ManeuverAction.leftExit;
  case 12:
    return ManeuverAction.rightExit;
  case 13:
    return ManeuverAction.leftRamp;
  case 14:
    return ManeuverAction.rightRamp;
  case 15:
    return ManeuverAction.leftFork;
  case 16:
    return ManeuverAction.middleFork;
  case 17:
    return ManeuverAction.rightFork;
  case 18:
    return ManeuverAction.ferry;
  case 19:
    return ManeuverAction.leftRoundaboutEnter;
  case 20:
    return ManeuverAction.rightRoundaboutEnter;
  case 21:
    return ManeuverAction.leftRoundaboutPass;
  case 22:
    return ManeuverAction.rightRoundaboutPass;
  case 23:
    return ManeuverAction.leftRoundaboutExit1;
  case 24:
    return ManeuverAction.leftRoundaboutExit2;
  case 25:
    return ManeuverAction.leftRoundaboutExit3;
  case 26:
    return ManeuverAction.leftRoundaboutExit4;
  case 27:
    return ManeuverAction.leftRoundaboutExit5;
  case 28:
    return ManeuverAction.leftRoundaboutExit6;
  case 29:
    return ManeuverAction.leftRoundaboutExit7;
  case 30:
    return ManeuverAction.leftRoundaboutExit8;
  case 31:
    return ManeuverAction.leftRoundaboutExit9;
  case 32:
    return ManeuverAction.leftRoundaboutExit10;
  case 33:
    return ManeuverAction.leftRoundaboutExit11;
  case 34:
    return ManeuverAction.leftRoundaboutExit12;
  case 35:
    return ManeuverAction.rightRoundaboutExit1;
  case 36:
    return ManeuverAction.rightRoundaboutExit2;
  case 37:
    return ManeuverAction.rightRoundaboutExit3;
  case 38:
    return ManeuverAction.rightRoundaboutExit4;
  case 39:
    return ManeuverAction.rightRoundaboutExit5;
  case 40:
    return ManeuverAction.rightRoundaboutExit6;
  case 41:
    return ManeuverAction.rightRoundaboutExit7;
  case 42:
    return ManeuverAction.rightRoundaboutExit8;
  case 43:
    return ManeuverAction.rightRoundaboutExit9;
  case 44:
    return ManeuverAction.rightRoundaboutExit10;
  case 45:
    return ManeuverAction.rightRoundaboutExit11;
  case 46:
    return ManeuverAction.rightRoundaboutExit12;
  default:
    throw StateError("Invalid numeric value $handle for ManeuverAction enum.");
  }
}

void sdkRoutingManeuveractionReleaseFfiHandle(int handle) {}

final _sdkRoutingManeuveractionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_ManeuverAction_create_handle_nullable'));
final _sdkRoutingManeuveractionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ManeuverAction_release_handle_nullable'));
final _sdkRoutingManeuveractionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ManeuverAction_get_value_nullable'));

Pointer<Void> sdkRoutingManeuveractionToFfiNullable(ManeuverAction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingManeuveractionToFfi(value);
  final result = _sdkRoutingManeuveractionCreateHandleNullable(_handle);
  sdkRoutingManeuveractionReleaseFfiHandle(_handle);
  return result;
}

ManeuverAction? sdkRoutingManeuveractionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingManeuveractionGetValueNullable(handle);
  final result = sdkRoutingManeuveractionFromFfi(_handle);
  sdkRoutingManeuveractionReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingManeuveractionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingManeuveractionReleaseHandleNullable(handle);

// End of ManeuverAction "private" section.

