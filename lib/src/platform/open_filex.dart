import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../../open_filex_plus.dart';

/// OpenFilex class
class OpenFilex {
  static const MethodChannel _channel = MethodChannel('open_file');

  OpenFilex._();

  ///linuxDesktopName like 'xdg'/'gnome'
  static Future<OpenResult> open(String filePath,
      {String? type, String? uti, String linuxDesktopName = "xdg"}) async {
    if (!Platform.isIOS && !Platform.isAndroid) {
      int result = -1;
      if (Platform.isMacOS) {
        final process = await Process.start('open', [filePath]);
        result = await process.exitCode;
      } else if (Platform.isWindows) {
        final process = await Process.start('cmd', ['/c', 'start', '', filePath]);
        result = await process.exitCode;
      } else if (Platform.isLinux) {
        final process = await Process.start("$linuxDesktopName-open", [filePath]);
        result = await process.exitCode;
      } else {
        throw UnsupportedError("Unsupported platform");
      }
      return OpenResult(
          type: result == 0 ? ResultType.done : ResultType.error,
          message: result == 0
              ? "done"
              : result == -1
                  ? "This operating system is not currently supported"
                  : "there are some errors when open $filePath");
    }

    Map<String, String?> map = {
      "file_path": filePath,
      "type": type,
      "uti": uti,
    };
    final result = await _channel.invokeMethod('open_file', map);
    final resultMap = json.decode(result) as Map<String, dynamic>;
    return OpenResult.fromJson(resultMap);
  }
}
