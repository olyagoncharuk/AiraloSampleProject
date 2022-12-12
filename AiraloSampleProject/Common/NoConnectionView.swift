//
//  NoConnectionView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 12.12.2022.
//

import SwiftUI

struct NoConnectionView: View {
    
    @EnvironmentObject var style: Style
    
    // MARK: - Properties
    
    @Binding var errorDescription: String
    
    var retry: (() -> Void)
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center) {
            Text(errorDescription)
                .withFontColorStyle(style.errorStyle)
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .padding(.top)
            Text("Please, make sure you are online and tap Retry")
                .withFontColorStyle(style.errorStyle)
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .padding(.bottom)
            Button {
                retry()
            } label: {
                Text("Retry")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionView(errorDescription: .constant("Offline"), retry: {
            print("Retrying")
        })
        .environmentObject(Style())
    }
}

