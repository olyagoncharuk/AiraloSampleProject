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
    var urlStr: String { get }
    var httpMethod: HttpMethod { get }
    var headerFields: [String: String]? { get }
}

typealias RemoteServiceSuccessfulCompletion<T> = (T) -> Void


public class RemoteService<T, Requestable> where T: Decodable, Requestable: NetworkRequestable {
    
    // MARK: - Properties
    
    var requestValues: Requestable
    
    private var cancellables = [AnyCancellable]()
    
    // MARK: - Initialization
    
    public init(requestValues: Requestable) {
        self.requestValues = requestValues
    }
    
}

extension RemoteService: ItemsProvider {
    
    // MARK: - Public interface
    
    public func getItems(completion: @MainActor @escaping (T) -> Void) {
        
        let url = URL(string: requestValues.urlStr)!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = requestValues.httpMethod.name
        
        requestValues.headerFields?.forEach { keyValuePair in
            request.setValue(keyValuePair.value, forHTTPHeaderField: keyValuePair.key)
        }
        
        if let requestBody = requestValues.httpMethod.requestBody {
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
