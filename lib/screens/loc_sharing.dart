import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator/location_dto.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:flutter/material.dart';
import 'package:background_locator/background_locator.dart';
import 'package:guard_app/widgets/logo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<PermissionStatus>(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: const [
                        Text("Checking premission status"),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasData) {
                    if (!snapshot.data!.isGranted &&
                        !snapshot.data!.isPermanentlyDenied) {
                      return Column(
                        children: [
                          Text(
                              "We need to access your location in the background, to do so please click on the button and then on permissions, location and 'Allow all the time'"),
                          ElevatedButton(
                              onPressed: () async {
                                openAppSettings();
                              },
                              child: Text("Open Settings"))
                        ],
                      );
                    } else if (snapshot.data!.isGranted) {
                      startLocationService();
                      return Column(
                        children: [
                          const Text("Location Sharing Started"),
                          ElevatedButton(
                              onPressed: () async {
                                IsolateNameServer.removePortNameMapping(
                                    _isolateName);
                                await BackgroundLocator
                                    .unRegisterLocationUpdate();
                                exit(0);
                              },
                              child: Text("Stop Location Tracking"))
                        ],
                      );
                    } else {
                      openAppSettings();
                      return const Text("Opening App Settings");
                    }
                  }
                  return const Text("Unknown State, Contact Us for help.");
                },
                future: Permission.locationAlways.status,
              )
            ],
          ),
        ),
      ),
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
