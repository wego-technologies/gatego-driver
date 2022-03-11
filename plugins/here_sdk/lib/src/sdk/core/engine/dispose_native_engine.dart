// Copyright (c) 2020 HERE Global B.V. and its affiliate(s).
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

import 'dart:async';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';

extension DisposeNativeEngine on SDKNativeEngine {
    // Stops pending requests and closes open files and databases in main thread. Dispose signal is sent
    // to dependent modules. Usage of engine, or dependent modules after calling dispose leads to undefined behavior.
    // Returns future to await operation.
    Future<void> dispose() async {
        final completer = Completer<void>();
        internaldispose(() {
            completer.complete();
        });
        return completer.future;
    }
}
