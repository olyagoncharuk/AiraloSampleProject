//
//  ListRowBackground.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct ListRowBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .background(.clear)
            .foregroundColor(.white.opacity(0.95))
            .padding(
                EdgeInsets(
                    top: 6,
                    leading: 20,
                    bottom: 6,
                    trailing: 20
                )
            )
            .shadow(color: .black.opacity(0.2), radius: 10)
    }
}
struct ListRowBackground_Previews: PreviewProvider {
    static var previews: some View {
        ListRowBackground()
    }
}
