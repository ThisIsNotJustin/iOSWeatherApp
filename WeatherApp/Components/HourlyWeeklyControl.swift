//
//  HourlyWeeklyControl.swift
//  WeatherApp
//
//  Created by Justin on 5/4/23.
//

import SwiftUI

struct HourlyWeeklyControl: View {
    @Binding var selection: Int
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 0
                    }
                } label: {
                    Text("Hourly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 1
                    }
                } label: {
                    Text("Weekly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
            
            Divider()
                .background(.white.opacity(0.75))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
                .blendMode(.overlay)
                .overlay {
                }
        }
        .padding(.top, 25)
    }
}

struct HourlyWeeklyControl_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeeklyControl(selection: .constant(0))
    }
}
