//
//  BottomSheet.swift
//  WeatherApp
//
//  Created by Justin on 5/3/23.
//

import SwiftUI

struct BottomSheet: View {
    @State var translation: CGSize = .zero
    @State var offsetY: CGFloat = 0
    @Binding var show: Bool
    var weather: ResponseBody
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    ZStack(alignment: .topTrailing) {
                        BottomSheetContentView(weather: weather)
                        Button {
                            withAnimation {
                                show.toggle()
                            }
                        } label : {
                            Image(systemName: "xmark")
                                .font(.body.bold())
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        .background(Color(UIColor(.black)))
                        .cornerRadius(30)
                        .frame(maxWidth: .infinity, maxHeight: proxy.size.height, alignment: .topTrailing)
                        .padding(28)
                        .opacity(show ? 1 : 0)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 50, style: .continuous))
            .offset(y: translation.height + offsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.easeInOut) {
                            let snap = translation.height + offsetY
                            let quarter = proxy.size.height/4
                            if snap > quarter && snap < quarter*3 {
                                offsetY = quarter*2
                            } else if snap > quarter*3 && snap < quarter*4 {
                                offsetY = quarter*3
                            } else if snap > quarter*4 {
                                offsetY = quarter
                            } else {
                                offsetY = 0
                                show = false
                            }
                            
                            translation = .zero
                        }
                    })
            .ignoresSafeArea(edges: .bottom)
        }
        
        
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(show: .constant(true), weather: previewWeather)
            .background(.red)
    }
}
