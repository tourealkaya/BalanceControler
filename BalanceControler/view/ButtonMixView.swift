//
//  MixButton.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 10/10/2023.
//

import SwiftUI

struct MixButton: View {
    var label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(40)
        }
        .padding(.horizontal, 20)
    }
}
