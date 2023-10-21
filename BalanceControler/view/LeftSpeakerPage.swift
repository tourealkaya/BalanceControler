//
//  LeftSpeakerPage.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 10/10/2023.
//

import SwiftUI

struct LeftSpeakerPage: View {
    @EnvironmentObject var sliderRepository: SliderRepository
    @Binding var isLeftMuted: Bool
    
    init(isLeftMuted: Binding<Bool>) {
        _isLeftMuted = isLeftMuted
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Toggle(isOn: $isLeftMuted) {
                    Text("Speaker on")
                    Text("Mute or unmute")
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))

                SliderView(
                    sliderValue: $sliderRepository.leftBassVolume,
                    sliderName: "BassVolume",
                    minValue: -15,
                    maxValue: 15,
                    step: 5
                )

                SliderView(
                    sliderValue: $sliderRepository.leftMidVolume,
                    sliderName: "MidVolume",
                    minValue: -15,
                    maxValue: 15,
                    step: 5
                )

                SliderView(
                    sliderValue: $sliderRepository.leftTrebleVolume,
                    sliderName: "TrebleVolume",
                    minValue: -15,
                    maxValue: 15,
                    step: 5
                )

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Left Speaker")
    }
}
