//
//  LocalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct LocalView: View {
    
    // MARK: - Properties
    
    var viewModel: LocalViewModel
    
    // MARK: - Body
    
    var body: some View {
        Text("Local")
    }
}

struct LocalView_Previews: PreviewProvider {
    static var previews: some View {
        LocalView(viewModel: LocalViewModel())
    }
}
