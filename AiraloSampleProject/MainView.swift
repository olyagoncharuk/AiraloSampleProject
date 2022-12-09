//
//  MainView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    let viewModel: MainViewModel
    let style = Style()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hello")
                    .withFontColorStyle(style.helloStyling)
                TopBarView()
            }
            Spacer()
        }
        .environmentObject(style)
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
