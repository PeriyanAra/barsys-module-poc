//
//  ContentView.swift
//  barsys-ios-poc
//
//  Created by Ara Periyan on 22.08.24.
//

import SwiftUI
import Flutter

struct FlutterViewControllerRepresentable: UIViewControllerRepresentable {
    // Access the AppDelegate through the view environment.
    @Environment(AppDelegate.self) var appDelegate

    func makeUIViewController(context: Context) -> FlutterViewController {
        let flutterViewController = FlutterViewController(project: nil, initialRoute: "random:data=25", nibName: nil, bundle: nil)
//        flutterViewController.modalPresentationStyle = .fullScreen
        return flutterViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

struct ContentView: View {
    @State private var showFlutter = false

    var body: some View {
        NavigationStack {
            Button("Open Flutter Feature") {
                showFlutter = true
            }
                .fullScreenCover(isPresented: $showFlutter) {
                FlutterViewControllerRepresentable()
            }
        }
    }
}
