//
//  SpeakerPage.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 07/10/2023.
//
import SwiftUI

struct SpeakerPage: View {
    @State private var isMuted = false
    @State private var bassVolume: Double = 0
    @State private var midVolume: Double = 0
    @State private var trebleVolume: Double = 0

    var speakerName: String

    var body: some View {
        VStack(alignment: .leading){
            Text("\(speakerName) Speaker")
                .font(.largeTitle)
            
            Toggle(isOn: $isMuted) {
                Text("Speaker on")
                Text("Mute or unmute")
            }
            .toggleStyle(SwitchToggleStyle(tint: .green))
            
            Text("Bass")
           
            Slider(value: $bassVolume, in: -15...15, step: 1)
            Text("Mid")
            Slider(value: $midVolume, in: -15...15, step: 1)
            
            Text("Treble")
            Slider(value: $trebleVolume, in: -15...15, step: 1)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SpeakerPage(speakerName: "Left")
}
