import UIKit
import Flutter
// import GoogleMaps

// import flutter_local_notifications //Import for notification

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // For notification
    // FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    // GeneratedPluginRegistrant.register(with: registry)}

    // For Maps
    // GMSServices.provideAPIKey("GOOGLE_API")

    GeneratedPluginRegistrant.register(with: self)
    // // For notification
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
