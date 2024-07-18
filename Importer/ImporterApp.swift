//
//  ImporterApp.swift
//  Importer
//
//  Created by Angelos Staboulis on 18/7/24.
//

import SwiftUI

@main
struct ImporterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(openFile: false, fileName: "")
        }
    }
}
