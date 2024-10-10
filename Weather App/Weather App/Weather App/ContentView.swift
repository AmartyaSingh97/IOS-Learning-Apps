//
//  ContentView.swift
//  Weather App
//
//  Created by Apple on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        ZStack{
            BackgroundView(isNight: isNight)
            
            VStack{

                CityTextView(cityName: "Bengaluru, Karnataka")
                
                MainWeatherView(image: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
            
                
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                }label:{
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  backgroundColor: .mint)}
                
                Spacer()
                 
            }
        }.onAppear(){
            let button = WeatherButton(title: "Change Day Time",
                                       textColor: .white,
                                       backgroundColor: .mint)
            
            print(type(of: button.body))
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text(dayOfWeek)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .medium,design: .default))
            
            Image(systemName:imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            
            Text("\(temperature)°")
                .foregroundStyle(.white)
                .font(.system(size:28,weight: .medium))
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                                   isNight ? .gray : .lightBlue]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View{
    
    var cityName: String
    
    var body: some View{
        
        Text(cityName)
            .font(.system(size:32, weight:.medium,design:.default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View{
    
    var image: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom,40)
    }
}


