//
//  CardView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var style: Style
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Discover Global")
                            .withFontColorStyle(style.cardTitleStyle)
                            .padding(.top)
                        
                        HStack {
                            Text("87 Countries")
                                .withFontColorStyle(style.cardSubtitleStyle)
                               
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom)
                        
                        ValueRowDivider()
                        
                        ValueRow(
                            imageName: "arrows-up-down",
                            title: "DATA",
                            valueText: "1 GB"
                        )
                        
                        ValueRowDivider()
                        
                        ValueRow(
                            imageName: "calendar",
                            title: "VALIDITY",
                            valueText: "7 Days"
                        )
                        
                        ValueRowDivider()
                        
                        
                        Button() {
                            
                        } label: {
                            Text("Buy Now")
                        }
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
            }
            Image("card-small")
                .offset(x: 80, y: -40)
        }
        .background(.red)
        .padding(.horizontal)
         
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .environmentObject(Style())
    }
}

fileprivate struct CardBackgroundView: View {
    var body: some View {
        VStack {
        }
        .frame(width: 335, height: 308)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "#07053F"),
                                                       Color(hex: "#0988A3")]),
                           startPoint: .leading, endPoint: .trailing)
            .cornerRadius(7)
        )
    }
}

fileprivate struct ValueRow: View {
    
    // MARK: - Properties
    
    var imageName: String
    var title: String
    var valueText: String
    
    @EnvironmentObject var style: Style
    
    var body: some View {
        HStack {
            Image(imageName)
            Text(title)
                .withFontColorStyle(style.uppercaseStyle)
            Spacer()
            Text(valueText).withFontColorStyle(style.valueStyle)
        }
        .padding(.trailing)
        .padding(.vertical, 10)
    }
}

fileprivate struct ValueRowDivider: View {
    var body: some View {
        Divider()
            .background(Color(hex: "#EEEEEE").opacity(0.3))
    }
}
