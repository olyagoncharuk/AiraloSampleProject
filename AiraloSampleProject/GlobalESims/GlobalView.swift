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
        ScrollView {
            ForEach(viewModel.packages) { package in
                VStack {
                    Text("Global for \(package.data)")
                }
                .frame(width: 335, height: 288)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(hex: package.color1),
                                                               Color(hex: package.color2)]),
                                   startPoint: .leading, endPoint: .trailing)
                    .cornerRadius(7)
                )
            }
        }.padding(.top)
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView(viewModel: GlobalViewModel())
    }
}
