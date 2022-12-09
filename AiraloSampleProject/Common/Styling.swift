//
//  Styling.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

protocol FontStyling {
    var color: Color { get }
    var font: Font { get }
}

protocol BackgroundStyling {
    var backgroundColor: Color { get }
}

protocol Styling: FontStyling, BackgroundStyling {}

final class TabBarButtonSelectedStyling: Styling {
    var color = Color(hex: "#4A4A4A")
    var font = Font.custom("IBMPlexSans-Medium", size: 13)
    var backgroundColor = Color(hex: "#EEEEEE")
}

final class TabBarButtonStyling: Styling {
    var color = Color(hex: "#8A8A8A")
    var font = Font.custom("IBMPlexSans-Medium", size: 13)
    var backgroundColor = Color.clear
}

class Style: ObservableObject {
    let tabBarButtonSelectedStyling = TabBarButtonSelectedStyling()
    let tabBarButtonStyling = TabBarButtonStyling()
}
