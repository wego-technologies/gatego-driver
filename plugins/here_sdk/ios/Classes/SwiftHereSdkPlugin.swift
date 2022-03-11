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
import heresdk
import UIKit

public class SwiftHereSdkPlugin: SwiftHereSdkBasePlugin, FlutterPlugin, FlutterPlatformViewFactory {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftHereSdkPlugin(registrar)

        super.register(instance: instance, registrar: registrar)
        registrar.register(instance, withId: methodChannelName)

        registrar.addApplicationDelegate(instance)
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        MapView.deinitialize()
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        MapView.pause()
    }

    public func applicationWillEnterForeground(_ application: UIApplication) {
        MapView.resume()
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        FlutterStandardMessageCodec.sharedInstance()
    }

    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) ->
            FlutterPlatformView {
        let mapView = { () -> MapView in
            let options = args as? [String: Any]
            let globeProjection = options?["globeProjection"] as? Bool
            let red = options?["initialBackgroundRed"] as? Double
            let green = options?["initialBackgroundGreen"] as? Double
            let blue = options?["initialBackgroundBlue"] as? Double
            var backgroundColor: UIColor?
            if let red = red, let green = green, let blue = blue {
                backgroundColor = UIColor(red: CGFloat(red),
                                          green: CGFloat(green),
                                          blue: CGFloat(blue),
                                          alpha: CGFloat(1.0))
            }
            switch (globeProjection, backgroundColor) {
                case let (globeProjection, color) where globeProjection == false:
                    return MapView(frame: frame,
                                   options: MapViewOptions(projection: .webMercator,
                                                          initialBackgroundColor: color))
                case let (globeProjection, color) where globeProjection == true:
                    return MapView(frame: frame,
                                   options: MapViewOptions(projection: .globe,
                                                           initialBackgroundColor: color))
                case let (_, color) where color != nil:
                    return MapView(frame: frame,
                                   options: MapViewOptions(initialBackgroundColor: color))
                default:
                    return MapView(frame: frame)
                }
        }()
        return MapController(viewIdentifier: viewId, registrar: registrar, mapView: mapView)
    }
}
