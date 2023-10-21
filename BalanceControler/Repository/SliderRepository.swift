//
//  SliderRepository.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 10/10/2023.
//

import Foundation
import Combine

class SliderRepository: ObservableObject {
    static let shared = SliderRepository()
    /*
    @Published var sliders = [
        MySlider(name: "Volume", value: 20),
        MySlider(name: "Balance", value: 4),
        MySlider(name: "Bass", value: 20),
        MySlider(name: "Mid", value: 20),
        MySlider(name: "Treble", value: 20)
    ]
    */
        
    @Published var isLeftMuted = false
    @Published var isRightMuted = false    

    @Published var leftBassVolume: Double = 0
    @Published var leftMidVolume: Double = 0
    @Published var leftTrebleVolume: Double = 0
    
    @Published var rightBassVolume: Double = 0
    @Published var rightMidVolume: Double = 0
    @Published var rightTrebleVolume: Double = 0

}
