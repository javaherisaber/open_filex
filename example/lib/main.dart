import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    if (Platform.isLinux) {
      _openLinuxFile();
    } else if (Platform.isAndroid) {
      _openAndroidExternalFile();
    } else if (Platform.isWindows) {
      _openWindowsFile();
    } else if (Platform.isMacOS) {
      _openMacOsFile();
    }
  }

  _openMacOsFile() async {
    final result = await OpenFilex.open("/Downloads/flutter.png");
    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  _openWindowsFile() async {
    final result = await OpenFilex.open("C:/Users/Lion/Downloads/flutter.png");
    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  _openLinuxFile() async {
    final result = await OpenFilex.open("/home/mehdi/Downloads/flutter.jpg");
    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  // ignore: unused_element
  _openIOSFile() async {
    final result = await OpenFilex.open("some path in your iOS device");
    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  // ignore: unused_element
  _openAndroidPrivateFile() async {
    //open an app private storage file
    final result = await OpenFilex.open(
        "/data/data/YOUR_PACKAGE_NAME/cache/IMG20230610192318.jpg");
    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  // ignore: unused_element
  _openAndroidOtherAppFile() async {
    //open an external storage image file on android 13
    if (await Permission.manageExternalStorage.request().isGranted) {
      final result = await OpenFilex.open("/data/user/0/xxx/images/1.jpg");
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });
    }
  }

  // ignore: unused_element
  _openAndroidExternalImage() async {
    //open an external storage image file on android 13
      final result = await OpenFilex.open("/sdcard/Download/k.apk");
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });

  }

  // ignore: unused_element
  _openAndroidExternalVideo() async {
    //open an external storage video file on android 13
    if (await Permission.videos.request().isGranted) {
      final result = await OpenFilex.open("/sdcard/Download/R-C.mp4");
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });
    }
  }

  // ignore: unused_element
  _openAndroidExternalAudio() async {
    //open an external storage audio file on android 13
    if (await Permission.audio.request().isGranted) {
      final result = await OpenFilex.open("/sdcard/Download/R-C.mp3");
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });
    }
  }

  // ignore: unused_element
  _openAndroidExternalFile() async {
    //open an external storage file
      final result = await OpenFilex.open("/sdcard/Download/k.apk");
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('open result: $_openResult\n'),
              TextButton(
                onPressed: openFile,
                child: const Text('Tap to open file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
