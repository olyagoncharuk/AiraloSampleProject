//
//  CardView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import SwiftUI

struct CardView: View {
    
    var viewModel: CardViewModel
    
    @EnvironmentObject var style: Style
    
    var body: some View {
        ZStack(alignment: .top) {
            CardBackgroundView()
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    TopView()
                    ValueRowDivider()
                    ValueRow(
                        imageName: "arrows-up-down",
                        title: "DATA",
                        valueText: "1 GB"
                    ).padding(.vertical, 10)
                    ValueRowDivider()
                    ValueRow(
                        imageName: "calendar",
                        title: "VALIDITY",
                        valueText: "7 Days"
                    ).padding(.vertical, 10)
                    ValueRowDivider()
                    
                }
                .padding(.horizontal, 20)

                BuyButton(title: viewModel.buyTitle)
            }
            Image("card-small")
                .offset(x: 80, y: -40)
        }
        .frame(width: 335, height: 336)
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(viewModel: CardViewModel())
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
        .shadow(color: .black.opacity(0.2), radius: 25)
    }
}

fileprivate struct TopView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var style: Style
    
    // MARK: - Body
    
    var body: some View {
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
    }
}

fileprivate struct ValueRowDivider: View {
    var body: some View {
        Divider()
            .background(Color(hex: "#EEEEEE").opacity(0.3))
    }
}

fileprivate struct BuyButton: View {
    
    // MARK: - Properties
    
    var title: String
    
    @EnvironmentObject var style: Style
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Button() {
            } label: {
                Text(title)
                    .withFontColorStyle(style.uppercaseStyle)
                    .padding()
                    
                    .frame(minWidth: 0,
                           maxWidth: .infinity, minHeight: 0, maxHeight: 44)
                    .tint(.white)
                    .overlay(RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.white, lineWidth: 1)
                             )
            }
        }
        .padding()
    }
}
