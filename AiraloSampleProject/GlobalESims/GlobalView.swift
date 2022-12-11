//
//  RegionalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct GlobalView: View {
//
    // MARK: - Properties
    
    @ObservedObject var viewModel: GlobalViewModel
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.packages) { package in
                    CardView(viewModel: CardViewModel())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
            }//.background(.blue)
        }
        //.background(.red)
        .listStyle(.plain)
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView(viewModel: GlobalViewModel(packages: packages_preview)).environmentObject(Style())
    }
}

var packages_preview = [
    GlobalPackage.package_preview(id: 0),
    GlobalPackage.package_preview(id: 1),
    GlobalPackage.package_preview(id: 2)]
