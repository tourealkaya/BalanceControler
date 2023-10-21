//
//  BalanceControlerApp.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 06/10/2023.
//

import SwiftUI

@main
struct BalanceControlerApp: App {
    @StateObject var repository = SliderRepository.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                FirstPage()
            }
            .environmentObject(repository)
        }
    }
}
