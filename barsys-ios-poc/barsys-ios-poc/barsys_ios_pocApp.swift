//
//  barsys_ios_pocApp.swift
//  barsys-ios-poc
//
//  Created by Ara Periyan on 22.08.24.
//

import SwiftUI
import Flutter
// The following library connects plugins with iOS platform code to this app.

@Observable
class AppDelegate: FlutterAppDelegate {
  let flutterEngine = FlutterEngine(name: "my flutter engine")

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      // Runs the default Dart entrypoint with a default Flutter route.
      flutterEngine.run();
      // Used to connect plugins (only if you have plugins with iOS platform code).
//      GeneratedPluginRegistrant.register(with: self.flutterEngine);
      return true;
    }
}

@main
struct barsys_ios_pocApp: App {
    // Use this property wrapper to tell SwiftUI
    // it should use the AppDelegate class for the application delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
          ContentView()
        }
    }
  }
