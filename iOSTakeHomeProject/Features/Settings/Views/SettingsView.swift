//
//  SettingsView.swift
//  iOSTakeHomeProject
//
//  Created by Joao Gripp on 17/07/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(UserDefaultKeys.hapticsEnable) private var isHapticsEnabled: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                haptics
            }
            .navigationTitle("Settings")
        }
    }
}

private extension SettingsView {
    var haptics: some View {
        Toggle("Enable Haptics", isOn: $isHapticsEnabled)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
