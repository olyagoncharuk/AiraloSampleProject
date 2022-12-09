//
//  TopBarView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Properties
    
    @State var selectedTabIndex: Int = 0
    var tabs = SimTab.allCases
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                TabBarButton(text: tab.title,
                             idx: tab.idx,
                             isSelected: isSelectedTabIndex(tab.idx),
                             tabIndex: $selectedTabIndex)
            }
        }
    }
    
    func isSelectedTabIndex(_ tabIndex: Int) -> Binding<Bool> {
        .init {
            tabIndex == selectedTabIndex
        } set: { _ in
        }

    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}

enum SimTab: Int, CaseIterable, Identifiable {
    case local = 0
    case regional = 1
    case global = 2
    
    var idx: Int {
        rawValue
    }
    
    var id: Int {
        idx
    }
    
    var title: String {
        switch self {
        case .local:
            return "Local eSIMs"
        case .regional:
            return "Regional eSIMs"
        case .global:
            return "Global eSIMs"
        }
    }
}
