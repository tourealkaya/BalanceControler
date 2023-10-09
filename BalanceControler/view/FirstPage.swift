//
//  FirstPage.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 07/10/2023.
//
import SwiftUI

struct FirstPage: View {
    @State private var volume: Double = 20
    @State private var balance: Double = 0
    @State private var isLeftMuted = false
    @State private var isRightMuted = false
    
    let repository = Sliderrepository.shaared
    let sliders : [Sliders]
    
    init(){
        self.sliders = repository.sliders
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {

                VStack(alignment: .leading) {
                    HStack(){
                        Text("Volume")
                        Spacer()
                        Text("\(Int(volume))")
                    }
                    Slider(value: $volume, in: 0...40, step: 1)
                }

                VStack(alignment: .leading) {
                    HStack(){
                        Text("Balance")
                        Spacer()
                        Text("\(Int(balance))")
                    }
                    Slider(value: $balance, in: -4...4, step: 1)
                }
                Spacer()
                HStack {
                    Spacer()
                    Image("left_speaker")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()

                    Spacer()
                    Image("right_speaker")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                Spacer()
                HStack {
                    Toggle(isOn: $isLeftMuted) {
                        Text("Left Speakers")
                        Text("Mute or unmute")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .red))

                    Toggle(isOn: $isRightMuted) {
                        Text("Right Speakers")
                        Text("Mute or unmute")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .red))
                }
                Spacer()
                HStack {
                    NavigationLink(destination: SpeakerPage(speakerName: "Left")) {
                        Text("Mix")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    Spacer()
                    NavigationLink(destination: SpeakerPage(speakerName: "Right")) {
                        Text("Mix")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                }
            }
            .padding()
            .navigationBarTitle("Settings", displayMode: .automatic)
        }
        .onChange(of: isLeftMuted) { newValue in
            if newValue {
                balance = -4
            } else {
                balance = isRightMuted ? 4 : 0
            }
        }
        .onChange(of: isRightMuted) { newValue in
            if newValue {
                balance = 4
            } else if (!newValue) {
                balance = isLeftMuted ? -4 : 0
            }
            else{
                balance = isRightMuted ? 4 : 0
            }
        }
    }
}
