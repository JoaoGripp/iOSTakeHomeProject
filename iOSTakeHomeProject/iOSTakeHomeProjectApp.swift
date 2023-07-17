//
//  iOSTakeHomeProjectApp.swift
//  iOSTakeHomeProject
//
//  Created by Joao Gripp on 28/08/22.
//

import SwiftUI

@main
struct iOSTakeHomeProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }
                SettingsView()
                    .tabItem {
                        Symbols.gear
                        Text("Settings")
                    }
            }
        }
    }
}
