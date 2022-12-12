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
    func getItems(completion: @escaping (T) -> Void)
}

public protocol NetworkRequestable<Body> {
    associatedtype Body
    var urlStr: String { get }
    var httpMethod: HttpMethod { get }
    var headerFields: [String: String]? { get }
}


typealias RemoteServiceSuccessfulCompletion<T> = (T) -> Void


public enum RemoteServiceResult<T> {
    case success(T)
    case failure(Error)
}


public class RemoteService<T, Requestable> where T: Decodable, Requestable: NetworkRequestable {
    
    enum FailureReason : Error {
        case sessionFailed(error: URLError)
        case decodingFailed
        case other(Error)
    }
    
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
    
    public func getItems(completion: @escaping (RemoteServiceResult<T>) -> Void) {
        
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
            .receive(on: DispatchQueue.main)
            .sink(
                            receiveCompletion: { completionn in
                                switch completionn {
                                case .failure(let error):
                                    completion(.failure(error))
                                    print("Error \(error)")
                                case .finished:
                                    print("Publisher is finished")
                                }
                        },
                            receiveValue: { decodedItem in
                                                completion(.success(decodedItem))
                                            })
//            .sink { receiveCompletion in
//                switch receiveCompletion {
//                    case .failure(let error):
//                        completion(.failure(error))
//                        print("Error \(error)")
//                    case .finished:
//                        print("Publisher is finished")
//                }
//            } receiveValue: { decodedItem in
//                completion(.success(decodedItem))
//            }
            .store(in: &cancellables)
        
    }
    
    
}
