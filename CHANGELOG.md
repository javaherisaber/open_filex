## 4.7.0
* Fix Android compatibility issues after Flutter 3.29.0 upgrade (Thanks to [mufassalhussain](https://github.com/mufassalhussain), PR[#19](https://github.com/javaherisaber/open_filex/pull/19))

## 4.6.0
* Fix platform errors for linux, windows, web, macos on Flutter 3.27+ (Thanks to [Xavier H.](https://github.com/xvrh), PR[#17](https://github.com/javaherisaber/open_filex/pull/17))

## 4.5.0
* Avoid using system to open on desktop platforms (Thanks to [@prateekmedia](https://github.com/prateekmedia), PR [#7](https://github.com/javaherisaber/open_filex/pull/7))
* Use dartPluginClass as default_package for desktop platforms (Thanks to [@sjordan2010](https://github.com/sjordan2010), PR [#16](https://github.com/javaherisaber/open_filex/pull/16))
* Update support for Android 14 (API 34) (Thanks to [@ShirishAryalKhalti](https://github.com/ShirishAryalKhalti), PR [#13](https://github.com/javaherisaber/open_filex/pull/13))
* Fix MissingPluginException for opening adding as flutter module (Thanks to [@joker-fu](https://github.com/joker-fu), PR [#11](https://github.com/javaherisaber/open_filex/pull/11))
* Allow open to run async on Desktop platforms (Thanks to [@lexxxel](https://github.com/lexxxel), PR [#15](https://github.com/javaherisaber/open_filex/pull/15))

## 4.4.0
* Fix error when embedding Flutter app to a native iOS app (Add-to-app) (Thanks to [@nukeolay](https://github.com/nukeolay), PR [#10](https://github.com/javaherisaber/open_filex/pull/10))

## 4.3.4
* Add namespace property to make compatible with gradle 8.0 (Thanks to [@kishormainali](https://github.com/kishormainali), PR [#9](https://github.com/javaherisaber/open_filex/pull/9))

## 4.3.3
* Update README.md

## 4.3.2
* Move plugin initializations to onAttachedToEngine() in Android (Thanks to [@DK070202](https://github.com/DK070202), mentioned at [#163](https://github.com/crazecoder/open_file/issues/163))

## 4.3.1
* Update README.md

## 4.3.0
* Replace JCenter with MavenCentral in Android build.gradle repositories (Thanks to [@BetterB0y](https://github.com/BetterB0y))

## 4.2.2
* Update CHANGELOG.md

## 4.2.1 
* Update CHANGELOG.md

## 4.2.0
* Upgrade support for Granular media permissions in Android 13 [Commit#261f446](https://github.com/javaherisaber/open_filex/commit/261f4463835eb293a059bc09030443d5093bcbd2) (Thanks to [@0975086498](https://github.com/0975086498))
* Remove usages of `REQUEST_INSTALL_PACKAGES` in Android plugin [PR#1](https://github.com/javaherisaber/open_filex/pull/1) (Thanks to [@thebeast1](https://github.com/thebeast1))
* Upgrade example project with latest version of flutter (3.3.5) and Android 13 [Commit#9d2027d](https://github.com/javaherisaber/open_filex/commit/9d2027d4063194c822bb81c7a74ff20aadb0f2ee)

## 4.1.1
* Add filePaths instruction for Android in README.md
* Fix parse args not filtering commands properly
* Fix viewController is not recognized in iOS

## 4.1.0
* Fixed Plugin lifecycle onDetachedFromActivity in Android
* Add getExternalFilesDir when checking if a path requires a permission

## 4.0.1
* Update readme descriptions

## 4.0.0
* Update ffi to 2.0.1
* Require Flutter 3.0.0+ and Dart 2.17.0+ (because of ffi 2.0.0+)
* Update example project with latest version of Flutter (3.0.5)

## 3.4.0
* Fix podspec in ios not resolved
## 3.3.0
* Remove dangerous permission `REQUEST_INSTALL_PACKAGES` in Android
## 3.2.1
* Add command parser before create system call [#144](https://github.com/crazecoder/open_file/issues/144) (thanks to [@mludovico](https://github.com/mludovico))
* Fix startActivity() might have NPE issue with filePath on Android (thanks to [@AlexV525](https://github.com/AlexV525))
* Add error type return when file path is nil on iOS
## 3.2.0
* add csv/kml/gpx/torrent support on Android
* remove android:requestLegacyExternalStorage
* fix Deprecated API warning when build on Android 
* delete uti, DocumentInteraction will be retrieved automatically on iOS (thanks to [@std-c](https://github.com/std-c))
* fix returns wrong reponse on Windows
## 3.1.0
* upgrade FFI 1.0.0 (thanks to [@mit-mit](https://github.com/mit-mit))
* add linuxByProcess parameter (thanks to [@mx1up](https://github.com/mx1up))
* Migrate to Dart null safety system (thanks to [@orevial](https://github.com/orevial))
## 3.0.3
* upgrade compileSdkVersion
## 3.0.2
* add storage compatibility mode for AndroidQ.
* fix [#106](https://github.com/crazecoder/open_file/issues/106) [#100](https://github.com/crazecoder/open_file/issues/100) [#74](https://github.com/crazecoder/open_file/issues/74)
* fix multiple file providers. (thanks to [@jawa0919](https://github.com/jawa0919))
* Take file extension in lowercase for comparison.(thanks to [@kluverua](https://github.com/kluverua))
* Fixed a typo in the error message for fileNotFound.(thanks to [@sebas642](https://github.com/sebas642))
## 3.0.1
* fix web parameter error
* Replace result value from String to OpenResult.
## 3.0.0
* updated to the v2 Android Plugin APIs
* Distinguish android errors (No APP found and others)
* add web support
* add pc support
## 2.1.1
* rollback 2.0.3
## 2.1.0-pre.1
* add web support(beta)
* add pc support(beta)
## 2.0.3
* change use FileProvider from Android M to Android N
## 2.0.2
* catch No Activity found to handle Intent exception
* Optimize request REQUEST_INSTALL_PACKAGES permission on Android O
## 2.0.1+2
* fix android M FLAG_GRANT_READ_URI_PERMISSION
## 2.0.1+1
* Fixed crash caused by third party plug-in request permissions
## 2.0.1
* migrate to androidx
## 1.3.0
* roll back support
## 1.2.3+1
* request READ_EXTERNAL_STORAGE when the file is not in the app directory
## 1.2.3
* Optimize permission request logic on android
## 1.2.2+2
* fix crash when requestPermission
## 1.2.2+1
* migrate to androidx
## 1.2.2
* ask for permission when needed
## 1.2.1
* fix somethings
## 1.2.0
* Add custom parameters,"type" android,"uti" iOS
## 1.1.1
* fix startActivity crash in android
## 1.1.0
* fix ios open file
## 1.0.7
* resolve conflict with other plugins about FileProvider and multi appcompat-v7 compile
## 1.0.6
* resolve conflict with image_provider plugin
## 1.0.5
* Just Support >=2.0.0-dev.28.0
## 1.0.4
* Just Support Dart2
## 1.0.3
* Just Support Dart2
## 1.0.2
* Ios Support added and support android 7.0 or above
