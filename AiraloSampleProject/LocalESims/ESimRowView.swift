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
            AsyncImage(url: item.imageURL) { image in
                image
                    .resizable()
                    .frame(width: 37, height: 28)
                    .aspectRatio(contentMode: .fit)
                    
            } placeholder: {
                Image(systemName: "flag")
                    .tint(.gray.opacity(0.2))
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

