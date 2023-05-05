//
//  SearchBar.swift
//  WeatherApp
//
//  Created by Justin on 5/3/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24).bold())
                    .foregroundColor(.white)
                
                TextField("Search City", text: $searchText)
                    .foregroundColor(.white).opacity(1.0)
                    
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.system(size: 26).bold())
                            .padding()
                            .offset(x:10)
                            .foregroundColor(.white)
                            .onTapGesture {
                                searchText = ""
                                isSearching.toggle()
                                
                            }
                        ,alignment: .trailing
                            
                    )
                
            }
            .font(.headline)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 20, alignment: .leading)
            .padding()
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(.black).opacity(0.3)
                    .shadow(color: .black.opacity(0.7), radius: 10, x:0, y:0)
            )
            .padding()
            
        }
    
        
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), isSearching: .constant(false))
    }
}
