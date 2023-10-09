//
//  SliderView.swift
//  BalanceControler
//
//  Created by TOURE on 09/10/2023.
//

import SwiftUI

struct SliderView : View{
    @Binding var slider : Sliders
    var body: some View{
        HStack(spacing: 16){
            Text(slider.name)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
//Slider(value: slider.value, in: -4...4, step: 1)
            Text("\(slider.value)")
        }
    }
    
}
