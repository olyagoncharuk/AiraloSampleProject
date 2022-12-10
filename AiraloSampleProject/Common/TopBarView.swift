//
//  TopBarView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Properties
    
    @Binding var selectedTabIndex: SimTab
    
    var tabs: [SimTab]
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                TabBarButton(text: tab.title,
                             idx: tab,
                             isSelected: isSelectedTabIndex(tab),
                             tabIndex: $selectedTabIndex)
            }
        }
    }
    
    func isSelectedTabIndex(_ tabIndex: SimTab) -> Binding<Bool> {
        .init {
            tabIndex == selectedTabIndex
        } set: { _ in
        }

    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(selectedTabIndex: .constant(SimTab.local),
                   tabs: SimTab.allCases)
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
