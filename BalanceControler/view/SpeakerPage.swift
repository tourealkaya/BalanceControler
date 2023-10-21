//
//  SpeakerPage.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 07/10/2023.
//
import SwiftUI
struct SpeakerPage: View {
    @EnvironmentObject var sliderRepository: SliderRepository
    @Binding var isRightMuted: Bool

    init(isRightMuted: Binding<Bool>) {
        _isRightMuted = isRightMuted
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Toggle(isOn: $isRightMuted) {
                    Text("Speaker on")
                    Text("Mute or unmute")
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))

                SliderView(
                    sliderValue: $sliderRepository.rightBassVolume,
                    sliderName: "BassVolume",
                    minValue: -15,
                    maxValue: 15,
                    step: 5
                )

                SliderView(
                    sliderValue: $sliderRepository.rightMidVolume,
                    sliderName: "MidVolume",
                    minValue: -15,
                    maxValue: 15,
                    step: 5
                )

                SliderView(
                    sliderValue: $sliderRepository.rightTrebleVolume,
                    sliderName: "TrebleVolume",
                    minValue: -15,
                    maxValue: 15,
                    step: 5
                )

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Right Speaker")
    }
}
