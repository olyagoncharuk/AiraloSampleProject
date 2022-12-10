//
//  LocalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct LocalView<Item>: View where Item: ESimDescribable {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: LocalViewModel<Item>
    
    @EnvironmentObject var style: Style
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section {
                    ForEach(viewModel.items) { item in
                        ESimRowView(item: item)
                    }
                } header: {
                    Text(viewModel.headerTitle)
                        .withFontColorStyle(style.tabViewTitleStyle)
                }
                
                .headerProminence(.increased)
            }
            .listStyle(.plain)
        }
    }
}

struct LocalView_Previews: PreviewProvider {
    static var previews: some View {
        LocalView(viewModel: LocalViewModel(items: preview_items))
            .environmentObject(Style())
    }
}

var preview_items = [Item_Preview(name: "Argentina"),
                     Item_Preview(name: "Canada"),
                     Item_Preview(name: "China")]

extension String: Identifiable {
    public var id: String {
        self
    }
}

class Item_Preview: ESimDescribable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var id: String {
        name
    }
    
    var description: String {
        name
    }
    
    var imageURL: URL? {
        nil
    }
}



