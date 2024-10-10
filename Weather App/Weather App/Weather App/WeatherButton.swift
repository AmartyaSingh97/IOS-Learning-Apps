//
//  WeatherButton.swift
//  Weather App
//
//  Created by Apple on 10/10/24.
//

import Foundation
import SwiftUI

struct WeatherButton: View{
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text("Change Day Time")
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10.0)
    }
}
