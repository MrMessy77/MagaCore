//
//  MagaCoreApp.swift
//  MagaCore
//
//  Created by MrMessy on 2023/4/28.
//

import SwiftUI

@main
struct MagaCoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(AppStore())
        }
    }
}
