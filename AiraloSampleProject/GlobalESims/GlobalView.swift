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
    
    // MARK: - Body
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.packages) { package in
                    CardView(viewModel: viewModel.viewModel(for: package))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(.plain)
        
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView(viewModel: GlobalViewModel(packages: packages_preview)).environmentObject(Style())
    }
}

var packages_preview = [
    Package.package_preview(id: 0),
    Package.package_preview(id: 1),
    Package.package_preview(id: 2)]
