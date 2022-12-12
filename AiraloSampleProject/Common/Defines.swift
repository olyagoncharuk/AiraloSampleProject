//
//  Defines.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

protocol ESimDescribable: Identifiable, CustomStringConvertible {
    var imageURL: URL? { get }
    var slug: String { get }
}

protocol ItemsOwner<Item> {
    associatedtype Item
    var items: [Item] { get set }
    var errorDescription: String { get set }
    var retryAction: (() -> Void)? { get set }
}


protocol ViewModel: ObservableObject, CustomStringConvertible, ItemsOwner {}

