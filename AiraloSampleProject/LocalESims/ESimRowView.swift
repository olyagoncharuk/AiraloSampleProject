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
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            AsyncImage(
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
                .padding(.leading)
            Spacer()
            Image(systemName: "arrowtriangle.right.fill")
        }
        .listRowBackground(ListRowBackground())
        .listRowSeparator(.hidden)
        .frame(height: 55)
        .padding(.horizontal)
    }
}

struct ESimRowView_Previews: PreviewProvider {
    static var previews: some View {
        ESimRowView<Item_Preview>(
            item: Item_Preview(name: "Ukraine")
        )
    }
}

struct ErrorView: View {
    let error: Error
    var body: some View {
        Image(systemName: "exclamationmark.triangle")
    }
}

