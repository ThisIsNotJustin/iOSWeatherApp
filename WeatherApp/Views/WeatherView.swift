//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Justin on 5/2/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    @State var show = false
    @State private var isSearching = false
    @State var searchText = ""
    @State var day: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            NavigationStack {
                VStack {
                    HStack {
                        VStack {
                            HStack {
                                Button {
                                    isSearching = true
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 24).bold())
                                        .padding()
                                        .foregroundColor(.white)

                                }
                                .navigationDestination(isPresented: $isSearching) {
                                    CityView()
                                        .background(getBackgoundColor())
                                
                                }
                                
                                
                                if !isSearching {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(weather.name)
                                            .bold().font(.title)
                                            .multilineTextAlignment(.center)
                                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                                Spacer()
                                    
                            }
                            .frame(width: 335)
                            .font(.headline)
                            .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    HStack {
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                        Text("F")
                            .font(.system(size:50))
                            .fontWeight(.bold)
                            .padding(.bottom)
                    }
                    
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                Text("\(weather.weather[0].main)")
                                    .font(.system(size: 24))
                            }
                            
                        }
                        HStack {
                            Image("city")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 420)
                            Spacer()
                                .frame(height: 80)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    Image(systemName: "chevron.compact.up")
                        .font(.system(size: 40))
                        .opacity(show ? 0 : 1)
                        .padding()
                        .onTapGesture {
                            withAnimation {
                                show.toggle()
                            }
                            
                        }
                    Spacer()
                        .frame(height: 60)
                    
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(getBackgoundColor())
                .preferredColorScheme(.dark)
            }
            
            ZStack {
                if show {
                    Color.black.opacity(0.15).ignoresSafeArea()
                    BottomSheet(show: $show, weather: weather)
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                }
            }
        }
    }
    
    func getBackgoundColor() -> Color {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        switch hour {
        case 0..<5:
            return Color(hue: 0.656, saturation: 0.787, brightness: 0.354)
        case 6..<21:
            return Color.cyan
        default:
            return Color(hue: 0.656, saturation: 0.787, brightness: 0.354)
        }
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView(weather: previewWeather)
        }
        
    }
}
