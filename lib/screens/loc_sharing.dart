import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator/location_dto.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:flutter/material.dart';
import 'package:background_locator/background_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String _isolateName = "LocatorIsolate";
ReceivePort port = ReceivePort();

class LocSharingPage extends StatefulHookConsumerWidget {
  const LocSharingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocSharingPageState();
}

class _LocSharingPageState extends ConsumerState<LocSharingPage> {
  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
    port.listen((dynamic data) {
      print(data);
    });
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await BackgroundLocator.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Sharing Location")),
    );
  }
}

void startLocationService() {
  BackgroundLocator.registerLocationUpdate(
    callback,
    initCallback: initCallback,
    initDataCallback: {},
    disposeCallback: disposedCallback,
    autoStop: false,
    iosSettings: const IOSSettings(
        accuracy: LocationAccuracy.NAVIGATION, distanceFilter: 0),
    androidSettings: const AndroidSettings(
      accuracy: LocationAccuracy.NAVIGATION,
      interval: 5,
      distanceFilter: 0,
      androidNotificationSettings: AndroidNotificationSettings(
        notificationChannelName: 'Location tracking',
        notificationTitle: 'Start Location Tracking',
        notificationMsg: 'Track location in background',
        notificationBigMsg:
            'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
        notificationIcon: '',
        notificationIconColor: Colors.grey,
        notificationTapCallback: notificationCallback,
      ),
    ),
  );
}

void callback(LocationDto locationDto) async {
  final SendPort? send = IsolateNameServer.lookupPortByName(_isolateName);
  send?.send(locationDto);
}

//Optional
void notificationCallback() {
  print('User clicked on the notification');
}

void initCallback(Map<String, dynamic>? data) {
  print('Initialized');
}

void disposedCallback() {
  print('Disposed');
}
