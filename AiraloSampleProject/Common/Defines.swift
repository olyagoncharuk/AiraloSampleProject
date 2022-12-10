//
//  Defines.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

protocol ESimDescribable: Identifiable, CustomStringConvertible {
    var imageURL: URL? { get }
}

protocol ItemsOwner<Item> {
    associatedtype Item
    var items: [Item] { get set }
}

protocol ViewModel: ObservableObject, CustomStringConvertible, ItemsOwner {}

