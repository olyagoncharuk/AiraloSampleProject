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
                    top: 8,
                    leading: 16,
                    bottom: 8,
                    trailing: 16
                )
            )
            .shadow(radius: 10)
    }
}
struct ListRowBackground_Previews: PreviewProvider {
    static var previews: some View {
        ListRowBackground()
    }
}
