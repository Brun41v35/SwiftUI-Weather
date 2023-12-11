//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Bruno Silva on 14/09/23.
//

import SwiftUI

struct ContentView: View {

    @State private var isNight: Bool = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
    
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 50)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 10)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.fill",
                                   temperature: 30)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 0)
                }

                Spacer()

                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  backgroundColor: .white,
                                  textColor: .blue)
                }

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - WeatherDayView

struct WeatherDayView: View {
    
    // MARK: - Variables
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16,
                              weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28,
                              weight: .medium))
                .foregroundColor(.white)
        }
    }
}

// MARK: - BackgroundView

struct BackgroundView: View {

    // MARK: - Variables

    var isNight: Bool

    // MARK: - Body

    var body: some View {
//        LinearGradient(colors: [isNight ? .black : .blue,
//                                isNight ? .gray : Color("lightBlue")],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

// MARK: - CityTextView

struct CityTextView: View {

    // MARK: - Variables

    var cityName: String

    // MARK: - Body

    var body: some View {
        Text(cityName)
            .font(.system(size: 32,
                          weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

// MARK: - MainWeatherStatusView

struct MainWeatherStatusView: View {

    // MARK: - Variables

    var imageName: String
    var temperature: Int

    // MARK: - Body

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70,
                              weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
