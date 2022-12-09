//
//  TabBarButton.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct TabBarButton: View {
    
    // MARK: - Properties
    
    let text: String
    let idx: SimTab
    @Binding var isSelected: Bool
    
    @Binding var tabIndex: SimTab
    
    @EnvironmentObject var style: Style
    
    var body: some View {
        Button(text) {
            tabIndex = idx
        }
        .buttonStyle(TabBarButtonStyle(
            isSelected: $isSelected,
            style: style.tabBarButtonStyling,
            styleSelected: style.tabBarButtonSelectedStyling)
        )
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(text: "Local eSIMs",
                     idx: SimTab.local,
                     isSelected: .constant(true),
                     tabIndex: .constant(SimTab.local)).environmentObject(Style())
    }
}

struct TabBarButtonStyle: ButtonStyle {
    
    @Binding var isSelected: Bool
    var style: Styling
    var styleSelected: Styling
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(isSelected ? styleSelected.color : style.color)
            .font(isSelected ? styleSelected.font : style.font)
            .frame(width: 112, height: 28, alignment: .center)
            .background(isSelected ? styleSelected.backgroundColor : style.backgroundColor)
            .cornerRadius(6)
    }
}
