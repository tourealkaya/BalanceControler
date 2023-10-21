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
    
    @EnvironmentObject var sliderRepository: SliderRepository

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SliderView(sliderValue: $volume, sliderName: "Volume", minValue: 0, maxValue: 20, step: 1)
                SliderView(sliderValue: $balance, sliderName: "Balance", minValue: -4, maxValue: 4, step: 1)

                Spacer()

                HStack {
                    Spacer()
                    Image("left_speaker")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()

                    Image("right_speaker")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                Spacer()

                HStack() {
                    ToggleView(name: "Left Speaker", isOn: $sliderRepository.isLeftMuted)
                        .onTapGesture {
                            sliderRepository.isRightMuted = false
                            balance = -4
                        }
                    ToggleView(name: "Right Speaker", isOn: $sliderRepository.isRightMuted)
                        .onTapGesture {
                            sliderRepository.isLeftMuted = false
                            balance = 4
                        }
                }

                HStack {
                    NavigationLink(destination: LeftSpeakerPage(isLeftMuted: $sliderRepository.isLeftMuted)) {
                        Text("Mix")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    Spacer()
                    NavigationLink(destination: SpeakerPage(isRightMuted: $sliderRepository.isRightMuted)) {
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
        }
        .navigationTitle("Settings")
        
        .onChange(of: sliderRepository.isLeftMuted) { newValue in
            if newValue {
                if sliderRepository.isRightMuted {
                    // Les deux enceintes sont activées, balance à 0
                    balance = 0
                } else {
                    balance = -4
                }
            } else {
                // La gauche n'est pas activée, vérifie l'état de la droite
                if !sliderRepository.isRightMuted {
                    balance = 0
                }
            }
        }

        .onChange(of: sliderRepository.isRightMuted) { newValue in
            if newValue {
                if sliderRepository.isLeftMuted {
                    // Les deux enceintes sont activées, balance à 0
                    balance = 0
                } else {
                    balance = 4
                }
            } else {
                // La droite n'est pas activée, vérifie l'état de la gauche
                if !sliderRepository.isLeftMuted {
                    balance = 0
                }
            }
        }

    }
}
