//
//  ESimRow.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import SwiftUI

struct ESimRowView<Item>: View where Item: ESimDescribable {
    
    // MARK: - Properties
    
    var item: Item
    
    @EnvironmentObject var style: Style
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            CacheAsyncImage(
                url: item.imageURL
            ) { phase in
                switch phase {
                case .success(let image):
                    HStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 37, height: 28)
                            
                    }
                case .failure(let error):
                    ErrorView(error: error)
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray.opacity(0.3)))
                @unknown default:
                    Image(systemName: "questionmark")
                }
            }

            Text(item.description)
                .withFontColorStyle(style.esimRowTitleStyle)
                .padding(.leading, 10)
            Spacer()
        }
        .frame(height: 55)
        .padding(.horizontal)
    }
}

struct ESimRowView_Previews: PreviewProvider {
    static var previews: some View {
        ESimRowView<Item_Preview>(
            item: Item_Preview(name: "Ukraine")
        )
        .environmentObject(Style())
    }
}

struct ErrorView: View {
    let error: Error
    var body: some View {
        Image(systemName: "exclamationmark.triangle")
    }
}

