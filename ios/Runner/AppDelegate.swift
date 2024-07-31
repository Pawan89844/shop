import UIKit
import Flutter
import FirebaseCore
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure();
    GeneratedPluginRegistrant.register(with: self)
//      if #available(iOS 10.0, *) {
//        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
//      }
      if #available(iOS 10.0, *) {
           UNUserNotificationCenter.current().delegate = self
           let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
           UNUserNotificationCenter.current().requestAuthorization(
             options: authOptions,
             completionHandler: { _, _ in }
           )
         } else {
           let settings: UIUserNotificationSettings =
             UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
           application.registerUserNotificationSettings(settings)
         }

         application.registerForRemoteNotifications()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


//extension AppDelegate: UNUserNotificationCenterDelegate{
//    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
//        completionHandler([.alert, .badge, .sound]);
//    }
//}
