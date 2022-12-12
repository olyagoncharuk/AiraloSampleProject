//
//  PackagesViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class PackagesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var packages: [Package] = []
    
    @Published var errorDescription: String = ""
    
    // MARK: - Initialization
    
    convenience init(packages: [Package]) {
        self.init()
        self.packages = packages
    }
    
    func viewModel(for package: Package) -> CardViewModel {
        CardViewModel(
            title: package.title,
            subtitle: package.subTitle,
            buyTitle: "US$\(formattedPrice(for: package)) - BUY NOW",
            gradientColor1: package.color1,
            gradientColor2: package.color2,
            dataValue: package.data,
            validityValue: package.validity,
            imageURL: package.imageURL)
    }
    
    private var currencyFormatter: Formatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }
    
    private func formattedPrice(for package: Package) -> String {
        currencyFormatter.string(for: NSNumber(value: package.price)) ?? ""
    }
}

struct PackagesList: Decodable {
    var id: Int
    var packages: [Package]
}
