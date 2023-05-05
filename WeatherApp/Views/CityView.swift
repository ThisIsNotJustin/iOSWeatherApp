//
//  CityView.swift
//  WeatherApp
//
//  Created by Justin on 5/4/23.
//

import SwiftUI

struct CityView: View {
    @State private var isSearching = false
    @State var searchText = ""

    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter { $0.location.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(searchResults) { forecast in
                            WeatherWidget(forecast: forecast)
                                
                        }
                    }
                }
                .safeAreaInset(edge: .top) {
                    EmptyView()
                        .frame(height: 10)
                }
            }
            
        }


    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
