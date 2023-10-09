//
//  SliderRepository.swift
//  BalanceControler
//
//  Created by TOURE on 09/10/2023.
//

import Foundation

class Sliderrepository{
    
    static let shaared = Sliderrepository()
    private(set) var sliders = [
        Sliders(name: "Volume", value: 0),
        Sliders(name: "Balance", value: 0),
        Sliders(name: "bass", value: 0),
        Sliders(name: "mid", value: 0),
        Sliders(name: "Treble", value: 0)
    ]
}
