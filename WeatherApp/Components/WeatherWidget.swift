//
//  WeatherWidget.swift
//  WeatherApp
//
//  Created by Justin on 5/4/23.
//

import SwiftUI

struct WeatherWidget: View {
    var forecast: Forecast
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black)
                .opacity(0.2)
                .frame(width: 342, height: 84)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        
                        Text("\(forecast.temperature.roundDouble())°")
                            .font(.system(size: 44))
                            .foregroundColor(.white)
                        Spacer()
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("H:\(forecast.high.roundDouble())°  L:\(forecast.low.roundDouble())°")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(1)
                            Text(forecast.location)
                                .font(.headline)
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(1)
                        }
                    }
                    
                }
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        }
        .frame(width: 342, height: 66, alignment: .bottom)
    }
}


struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidget(forecast: Forecast.cities[0])
            .background(.white)
    }
}

