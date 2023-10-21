//
//  ToggleView.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 10/10/2023.
//

import Foundation
import SwiftUI

struct ToggleView: View {
    var name: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(name)
            Text("Mute or unmute")
        }
    }
}
