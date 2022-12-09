//
//  TabBarButton.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .font(.custom("IBMPlexSans-Medium", size: 15))
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(text: "Local eSIMs",
                     isSelected: .constant(true))
    }
}
