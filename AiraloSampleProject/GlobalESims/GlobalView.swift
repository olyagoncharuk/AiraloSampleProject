//
//  RegionalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct GlobalView: View {
    
    // MARK: - Properties
    
    var viewModel: GlobalViewModel
    
    var body: some View {
        Text("Global")
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView(viewModel: GlobalViewModel())
    }
}
