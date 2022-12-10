//
//  RegionalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct RegionalView<Item>: View where Item: CustomStringConvertible,
                                             Item: Identifiable{
    
    // MARK: - Properties
    
    var viewModel: RegionalViewModel<Item>
    
    var body: some View {
        Text("Regional")
    }
}

struct RegionalView_Previews: PreviewProvider {
    static var previews: some View {
        RegionalView(viewModel: RegionalViewModel(items: preview_items))
    }
}
