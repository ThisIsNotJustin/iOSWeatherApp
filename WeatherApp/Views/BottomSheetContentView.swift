//
//  BottomSheetContentView.swift
//  WeatherApp
//
//  Created by Justin on 5/3/23.
//

import SwiftUI

struct BottomSheetContentView: View {
    var weather: ResponseBody
    @State private var selection = 0
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 3, style: .continuous)
                .frame(width: 60, height: 5)
                .padding(8)
                .foregroundColor(.black)
            
            
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    HourlyWeeklyControl(selection: $selection)
                    Spacer()
                }
                HStack {
                    WeatherRow(logo: "thermometer", name: "Low", value: (weather.main.tempMin.roundDouble() + ("°")))
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    WeatherRow(logo: "thermometer", name: "High", value: (weather.main.tempMax.roundDouble() + "°"))
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(8)
                }
                .padding()
                HStack {
                    WeatherRow(logo: "wind", name: "Wind", value: (weather.wind.speed.roundDouble() + " mph"))
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(12)
                }
                
                .padding(.top, 30)
                Spacer()
            }
            .padding()
        }
    }
    
}

struct BottomSheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetContentView(weather: previewWeather)
            .background(.white)
    }
}
