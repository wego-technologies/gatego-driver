//
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

import Flutter
import UIKit
import os.log
import heresdk

public class SwiftHereSdkBasePlugin: NSObject {
    static let methodChannelName = "com.here.flutter/here_sdk"

    public static func register(instance: SwiftHereSdkBasePlugin, registrar: FlutterPluginRegistrar) {
        do {
            try SDKInitializer.initializeIfNecessary()
        } catch {
            fatalError("Failed to initialize HERE SDK. Cause: \(error)")
        }

        let channel = FlutterMethodChannel(
            name: methodChannelName,
            binaryMessenger: registrar.messenger(),
            codec: FlutterStandardMethodCodec.sharedInstance())

        weak var weakSelf: SwiftHereSdkBasePlugin? = instance
        channel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) in
            weakSelf?.onMethodCall(call, result)
        })
    }

    public static func log(_ pattern: String, _ data: CVarArg) {
        NSLog(pattern, data)
    }

    var registrar: FlutterPluginRegistrar

    init(_ registrar: FlutterPluginRegistrar) {
        self.registrar = registrar
    }

    public func onMethodCall(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented)
    }
}

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs the view cycles like viewDidLoad.
    static let hsdk = OSLog(subsystem: subsystem, category: "hsdk")
}
