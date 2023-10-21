//
//  SliderView.swift
//  BalanceControler
//
//  Created by TOURE Alkaya Sidi on 10/10/2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    var sliderName: String
    var minValue: Double
    var maxValue: Double
    var step: Double

    init(sliderValue: Binding<Double>, sliderName: String, minValue: Double, maxValue: Double, step: Double) {
        self._sliderValue = sliderValue
        self.sliderName = sliderName
        self.minValue = minValue
        self.maxValue = maxValue
        self.step = step
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(){
                Text(sliderName)
                Spacer()
                Text("\(Int(sliderValue))")
            }
            Slider(value: $sliderValue, in: minValue...maxValue, step: step)
        }
    }
}

