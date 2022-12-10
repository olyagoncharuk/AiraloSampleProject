//
//  LocalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct ESimListView<Item, VM>: View where Item: ESimDescribable, VM: ViewModel, Item == VM.Item  {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: VM//LocalViewModel<Item>
    
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
                    Text(viewModel.description)
                        .withFontColorStyle(style.tabViewTitleStyle)
                }
                
                .headerProminence(.increased)
            }
            .listStyle(.plain)
        }
    }
}

struct ESimListView_Previews: PreviewProvider {
    static var previews: some View {
        ESimListView(viewModel: LocalViewModel(items: preview_items))
            .environmentObject(Style())
    }
}


