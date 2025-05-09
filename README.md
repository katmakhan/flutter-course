# Flutter Syllabus
Create your flutter projects by using the sample resources, and get your web/apk/ios builds right away

### Getting Started
```console
flutter create <project_name>
```
Copy the necessary resource files from the repo
```console
flutter build web
```
```console
flutter build web --web-renderer html
```

Run the build in an emulator or chrome or press `crtl`+`F5` for debubbing and run or just `F5` to run without debugger attached.
```console
flutter run
```

### IOS Setting Up
Go inside IOS folder
```bash
cd ios
```
Deintegrate IOS if needed
```bash
pod Deintegrate
```
Update the latest Pod Version
```bash
pod Update
```

### Key Generation
- Debug Key Generation
Get to terminal and enter
```console
keytool -list -v -keystore ~/.android/debug.keystore -storepass android
```

- Signed Key Generation
```console
keytool -alias key0 -keystore your_keystore_name -storepass your_keystore_password -keypass your_key_password -list -v
```

### Firebase Setting Up
- Setup All firebase Features
1. Firebase `AppCheck`
2. Firebase `Authencation` (Add `Gmail` as `new provider` inside `sign-in-method`)
2. Firebase `Remoteconfig`
3. Firebase `Database`
4. Firebase `Cloudstorage`
5. Firebase `Functions` (Only for `blaze` plan)

- Add keys into the Firebase Projects
1. Add a `IOS` project with `com.companyname.appname`
2. Add an `Android` project with `com.companyname.appname`

### Bundle Name/ AppName
- The app name or bundle name is used as identifier in `playstore` and `appstore`
- Make sure you also purchase the domain `companyname.com` for better integration
- If you have `companyname.in` domain, it's also fine, but its better to take `.com` also for future proofing
- The default name would be `com.example.flutterprojectname`

### Changing the appname in Android
- Also change `build.gradle` inside the `app` folder inside android
Go to `android>> app >> build.gradle` and change the `applicationId` to your own `com.companyname.appname` 
```console
defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.companyname.appname"

        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```
- Also change in
```console
android {
    namespace "com.companyname.appname"
    .....
    .....
}
```

- Also add google sign-in in `build.gradle` above `android namespace`
```console
apply plugin: 'com.google.gms.google-services'

android {
    namespace "com.companyname.appname"
    .....
    .....
    multiDexEnabled true //Make sure you add multi dex
}
```

### Changing the appname in IOS
- Open the ios folder inside your flutter folder
- right click on the folder, and choose `open in xcode`
- Open the `runner`, change the package name to `com.companyname.appname`

### Quick Change
- `ctrl`+`shift`+`H` for find and replace
- find `com.example.flutterprojectname` to `com.companyname.appname`

### Copy the Firebase service files
Make sure you `enable the firebase services` and also added your dev `SHA1-key` into the firebase console
- Then download `google-services.json` and paste it inside `android/app/` alongside `build.gradle`
- Then download `GoogleService-info.plist` and paste it inside `ios/runner` alongside `info.plist`
- Also check the content inside each to verify, your `production-sha-key` and `developer-sha-key` are inside the json file
- Make sure to write `gitignore` on public projects files, as these files holds the api key acccess for clientside.

```console
# Ignore Google Services JSON files for Android in all Flutter projects
**/android/app/google-services.json

# Ignore Google Service Info plist files for iOS in all Flutter projects
**/ios/Runner/GoogleService-Info.plist
```

### Firebase Setting-up in IOS
- Refer `https://pub.dev/packages/google_sign_in`
- Copy the `REVERSED_CLIENT_ID` from `GoogleService-info.plist`
- If you cant find the `REVERSED_CLIENT_ID`, make sure you created and enabled `google` signin from `authentication` inside `firebase console`
- If you are still facing error, make sure the `bundle ID` is same in the `xcode` and the `fireabase console
`
- Make sure you chane all profiles , `debug`, `release` and `profile` to the same `bundle id`
- Change the bundle id through out the app using `find and replace` option.

```console
<key>REVERSED_CLIENT_ID</key>
	<string>com.googleusercontent.apps.3232323223-1urjaf9ia017upf6lsdfsfk3sekdfs9gq0c9d</string>
```
- Add the whole code into `info.plist` and also change the `REVERSED_CLIENT_ID` with copied value
```console
<!-- Put me in the [my_project]/ios/Runner/Info.plist file -->
<!-- Google Sign-in Section -->
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<!-- TODO Replace this value: -->
			<!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
			<string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
		</array>
	</dict>
</array>
<!-- End of the Google Sign-in Section -->
```

- If get error `impeller not connected, taking longer`
- Paste this code inside info.plist
```
<key>FLTEnableImpeller</key>
  <false/>
```

- If you get error `[FirebaseCore][I-COR000005] No app has been configured yet.`, make sure you add `WidgetsFlutterBinding.ensureInitialized();` in `main()`
```dart
Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized(); // Ensure initialisation
  await Firebase.initializeApp();
  // await Get.put(Database()).initStorage();

  runApp(const MyApp()); // This should be called after calling firebase and binding
}
```

### Multidex Error
Change the build.gradle main file.
```console
android {
    namespace "com.companyname.appname"
    .....
    .....
    multiDexEnabled true //Make sure you add multi dex
}
```

### PlatformException in Android
- Make sure you have added google-services.json in `android/app`
- Make sure you have added `apply plugin: 'com.google.gms.google-services'` in build.gradle (app)
- Make sure you have added `classpath 'com.google.gms:google-services:4.3.15'` in build.gradle (main)

- build.gradle (app)
```console
apply plugin: 'com.google.gms.google-services' //Add this to ensure the google-services intialisation

android {
    namespace "com.companyname.appname"

    compileSdkVersion flutter.compileSdkVersion
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
``` 
- build.gradle (main)
```console
buildscript {
    ext.kotlin_version = '1.7.10'
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.0'

        classpath 'com.google.gms:google-services:4.3.15' // Add this inside dependency for firebase

        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

```

### Error: FirebaseApp has not been correctly initialized in IOS
- Even tho you have copied the file `GoogleService-info.plist` into the folder, it won't work
- You need to manually add to `runner` via `xcode`, reffer to the following link
```console
https://firebase.flutter.dev/docs/manual-installation/ios/
```

### Error: SHAkey or gsm-service error while gmail Sign-In
If you find yourself having `gsm.google.service` errors, its probably because your debug, production key are not updated on the `cloud.google` console, even tho you have added in `firebase.google.com`. If thats the case, you have to do the following steps

1. Select the project and go to API and services>
2. Credentials > Android key (Edit this auto created by firebase)
3. Add the new Key  (SHA-1 of the debug) and save
4. Wait for 5 seconds

### Datamodels
- Goto json to dart converter
```console
https://javiercbk.github.io/json_to_dart/
```
- Make the json for the datamodel
```json
{
    "name":"something",
    "email":"something@gmail.com",
    "date":"15/06/1999",
    "time": "3:00 AM",
    "timeinmill":5656565
}
```
- Name the datamodel class as `dm_user`
- Generate the code
- Copy paste the code to `dm_user.dart` under the `DataModels` folder.
- Remember to change the `fromJson` , `dm_user.fromJson(Map<String, dynamic> json)` to `dynamic,dynamic>`
- Genereated Version
```dart
    dm_user.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
    time = json['time'];
    timeinmill = json['timeinmill'];
  }
```
- Right version
```dart
    dm_user.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
    time = json['time'];
    timeinmill = json['timeinmill'];
  }
```

### Lint Yellow Signs
- To disbale yellow warning signs when using print functions 
- go to `analysis_options.yaml` and uncomment `avoid_print: false` to not show the warning

```console
linter:
  # producing the lint.
  rules:
    avoid_print: false  # Uncomment to disable the `avoid_print` rule
```

### Upgrading Compile SDK to 33
- Upgrade the `ext.kotlin_version` inside `build.gradle` to
```console
ext.kotlin_version = '1.7.10'
```
- Upgrade the `tools.build:gradle` inside `build.gradle` to
```console
classpath 'com.android.tools.build:gradle:7.3.0'
```

### Using imagepicker
- Add the following permission code inside the `info.plist` in ios to get access to `photo library`
```console
    <!-- Start of photo gallery Permisison -->
    <key>NSPhotoLibraryUsageDescription</key>
    <string>We need access to your photo library to pick images for your profile.</string>
    <!-- End of photo gallery Permisison -->
```

### Notification
- add in `pubspec.yaml`
```yaml
# show notification
flutter_local_notifications: ^16.1.0

# listen for notification
rxdart: ^0.27.7
```

- add this to `ios` >>`Runner`>> `AppDelegate.swift`
- also add `import` function on top of the `AppDelegate.swift`
```console
import flutter_local_notifications
```
- add this code inside the `bool` function, above the `return` callback
```console
FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    GeneratedPluginRegistrant.register(with: registry)}
```
- just above the `return` statement
```console
// For notification
if #available(iOS 10.0, *) {
         UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }
```

- sample code
```console
import UIKit
import Flutter

import flutter_local_notifications //Import for notification

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // For notification
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    GeneratedPluginRegistrant.register(with: registry)}

    GeneratedPluginRegistrant.register(with: self)
    // For notification
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

```
- add the `initialisation` in the `main.dart`
- it shoulde be inside the `main` function above `runApp(const MyApp());`
```console
await NotificationService().initNotification();

runApp(const MyApp());
```
- add to android manifest, for API 33 or greater
```console
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/> 
```
- add to main function, to request the acess, above `runApp(const MyApp());` function
```console
await Permission.notification.isDenied.then((value) {
        if (value) {
          Permission.notification.request();
        }
      });

runApp(const MyApp());
```

### Error with file_version_info
- change the file at `/Users/name/.pub-cache/hosted/pub.dev/package_info_plus_windows-2.1.0/lib/src/file_version_info.dart`
- from this
```console
class _LANGANDCODEPAGE extends Struct {
  @Uint16()
  external int? wLanguage;

  @Uint16()
  external int? wCodePage;
}
```

- to this
```console
class _LANGANDCODEPAGE extends Struct {
  @Uint16()
  external int wLanguage;

  @Uint16()
  external int wCodePage;
}
```

### Google Maps
- In `Android`, Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml
```console
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```
- In `IOS`, go to `AppDelegate.swift` and also `import GoogleMaps`
```console
import GoogleMaps

GMSServices.provideAPIKey("YOUR KEY HERE")
```

### Refresh View after adding new data
- There is no method to actually refresh the page
- It can be done on `Oninit` or `Build` state
- So the work arround is to use `async` on `ontap` method
- and calling `setstate` after the await
```console
InkWell(
  onTap: () async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ActAddChapters(
              widget.coursesdata.crKey.toString())),
    );
    setState(() {});
  },
  child: AddChaptersButton(),
),
```

### Adding open dial, chrome, whatsap, telegram links
- Add these to manifest.xml on `android`
- Above the `application` tag
```console
<queries>
        <!-- <package android:name="com.whatsapp" /> -->
        <package android:name="com.android.chrome" />
        <!-- <package android:name="org.telegram.messenger" /> -->
        <package android:name="com.google.android.youtube" />
        <!-- <package android:name="com.twitter.android" /> -->
        <!-- <package android:name="com.instagram.android" />
        <package android:name="com.facebook.katana" />
        <package android:name="com.facebook.lite" /> -->

        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
        <intent>
            <action android:name="android.intent.action.DIAL" />
            <data android:scheme="tel" />
        </intent>
        <intent>
            <action android:name="android.intent.action.SEND" />
            <data android:mimeType="*/*" />
        </intent>
</queries>
```

### Creating app logo
- Update the `pubspec.yaml`
- Change the `icon_background` to any color if you want
```console

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.9.2 


flutter_icons:
  android: true
  ios: true
  remove_alpha_ios: true
  image_path: "assets/images/stockexlogo.png"
  min_sdk_android: 21 # android min sdk min:16, default 21
  adaptive_icon_background: "#000000"
  adaptive_icon_foreground: "assets/images/logo_foreground.png"
```

- Create `logo_foreground.png` from
```console
https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html
```
- Then finish by running
```console
flutter pub run flutter_launcher_icons:main
```

### Get IOS Simulator UUID
- find the uuid and add the simulator as test device in google mobile ads
```console
xcrun simctl list
```

- Update the `AndroidManifest.xml` under `<application>` tag
```console
<meta-data
  android:name="com.google.android.gms.ads.APPLICATION_ID"
  android:value="@string/admob_app_id" />

```
- Update `info.plist`
```console
<!-- Google Mobile Ads Section -->
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-93453535353535~1243242424</string>
<!-- End of the Google Ads Section -->

```


### Updating to Sequoia
- Find simulator data
```
open ~/Library/Developer/CoreSimulator
```
- Deleting unused simulator
```
xcrun simctl delete unavailable
```
- Getting some space, deleting cache and other artifacts in android
```
open ~/.gradle/wrapper/dists/
```

```
open ~/.gradle/caches/
```


### Updating the gradle
- Copy the following gradle files 
- `build.gradle.kts`
- `build.gradle.kts` in app also
- `settings.gradle.kts`
- `gradle-wrapper.properties` inside the gradle/wrapper
- `proguard-rules.pro` for minify
- Then update the flutter packages to latest
- Update `local.properties` with
```
flutter.ndkVersion=27.0.12077973
flutter.compileSdkVersion=36
flutter.targetSdkVersion=36
```
- Add gitignore
```
/android/app/.cxx/
```
- If already added, remove via terminal command
```
git rm -r --cached android/app/.cxx/
```

