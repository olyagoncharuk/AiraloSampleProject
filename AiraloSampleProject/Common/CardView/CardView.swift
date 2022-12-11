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
            CardBackgroundView(
                gradientColor1: viewModel.gradientColor1,
                gradientColor2: viewModel.gradientColor2
            )
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    TopView(
                        title: viewModel.title,
                        subTitle: viewModel.subtitle)
                    ValueRowDivider()
                        .padding(.top, 14)
                    ValueRow(
                        imageName: "arrows-up-down",
                        title: "DATA",
                        valueText: viewModel.dataValue
                    ).padding(.vertical, 10)
                    ValueRowDivider()
                    ValueRow(
                        imageName: "calendar",
                        title: "VALIDITY",
                        valueText: viewModel.validityValue
                    ).padding(.vertical, 10)
                    ValueRowDivider()
                    
                }
                .padding(.horizontal, 20)

                BuyButton(title: viewModel.buyTitle)
            }
            CacheAsyncImage(
                url: viewModel.imageURL
            ) { phase in
                switch phase {
                case .success(let image):
                    HStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140, height: 88)
                            
                    }
                case .failure(_):
                    Color.clear
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray.opacity(0.3)))
                @unknown default:
                    Color.clear
                }
            }
            .offset(x: 80, y: -20)
        }
        .frame(width: 335, height: 330)
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            viewModel: CardViewModel.model_preview
        )
            .environmentObject(Style())
    }
}

fileprivate struct CardBackgroundView: View {
    
    // MARK: - Properties
    
    var gradientColor1: String //"#07053F"
    
    var gradientColor2: String //"#0988A3"
    
    // MARK: - Body
    
    var body: some View {
        VStack {
        }
        .frame(width: 335, height: 308)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [Color(hex: gradientColor1),
                             Color(hex: gradientColor2)]),
                           startPoint: .leading, endPoint: .trailing)
            .cornerRadius(7)
        )
        .shadow(color: .black.opacity(0.2), radius: 25)
    }
}

fileprivate struct TopView: View {
    
    // MARK: - Properties
    
    var title: String
    
    var subTitle: String
    
    @EnvironmentObject var style: Style
    
    // MARK: - Body
    
    var body: some View {
        Text(title)
            .withFontColorStyle(style.cardTitleStyle)
            .padding(.top)
        
        HStack {
            Text(subTitle)
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
