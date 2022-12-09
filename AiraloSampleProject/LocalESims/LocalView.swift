//
//  LocalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct LocalView<Item>: View where Item: CustomStringConvertible,
                                   Item: Identifiable {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: LocalViewModel<Item>
    
    @EnvironmentObject var style: Style
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Image(systemName: "flag.fill")
                            Text(item.description)
                            Spacer()
                            Image(systemName: "arrowtriangle.right.fill")
                        }
                        .listRowBackground(ListRowBackground())
                        .listRowSeparator(.hidden)
                        .frame(height: 55)
                        .padding(.horizontal)
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

var preview_items = ["Argentina", "Canada", "China"]

extension String: Identifiable {
    public var id: String {
        self
    }
}


