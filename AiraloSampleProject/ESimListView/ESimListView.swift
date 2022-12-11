//
//  LocalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct ESimListView<Item, VM, ChildView: View>: View where Item: ESimDescribable, VM: ViewModel, Item == VM.Item  {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: VM
    
    @EnvironmentObject var style: Style
    
    @ViewBuilder var builder: (String) -> ChildView
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    Section {
                        ForEach(viewModel.items) { item in
                                NavigationLink(destination: builder(item.slug)) {
                                    ESimRowView(item: item)
                                }
                                .listRowBackground(ListRowBackground())
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 40))
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
}

struct ESimListView_Previews: PreviewProvider {
    static var previews: some View {
        ESimListView(viewModel: LocalViewModel(items: preview_items)) { slug in
            PackagesView(viewModel: PackagesViewModel(packages: packages_preview))
        }
        .environmentObject(Style())
    }
}


