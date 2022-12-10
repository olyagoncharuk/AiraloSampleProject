//
//  RemoteService.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation
import Combine

public protocol ItemsProvider<T> {
    associatedtype T
    func getItems(completion: @MainActor @escaping (T) -> Void)
}

public protocol NetworkRequestable<Body> {
    associatedtype Body
    static var urlStr: String { get }
    static var httpMethod: HttpMethod { get }
    static var headerFields: [String: String]? { get }
}

typealias RemoteServiceSuccessfulCompletion<T> = (T) -> Void


public class RemoteService<T, R> where T: Decodable, R: NetworkRequestable {
    
    // MARK: - Properties
    
    private var cancellables = [AnyCancellable]()
    
    // MARK: - Initialization
    
    public init() {}
    
}

extension RemoteService: ItemsProvider {
    
    // MARK: - Public interface
    
    public func getItems(completion: @MainActor @escaping (T) -> Void) {
        
        let url = URL(string: R.urlStr)!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = R.httpMethod.name
        
        R.headerFields?.forEach { keyValuePair in
            request.setValue(keyValuePair.value, forHTTPHeaderField: keyValuePair.key)
        }
        
        if let requestBody = R.httpMethod.requestBody {
            request.httpBody = requestBody
        }
        
        let session = URLSession.shared
        
        session.dataTaskPublisher(for: request)
            .retry(1)
            .map({ $0.data })
            .decode(type: T.self, decoder: JSONDecoder())
            .sink { completion in
                print("completion occured \(completion)")
            } receiveValue: { decodedItem in
                Task {
                    await completion(decodedItem)
                }
            }.store(in: &cancellables)
        
    }
}
