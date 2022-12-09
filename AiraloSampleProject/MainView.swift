//
//  MainView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct MainView: View {
    var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
