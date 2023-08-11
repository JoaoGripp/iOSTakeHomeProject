//
//  NetworkingManagerUsersResponseFailureMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 04/08/23.
//

#if DEBUG

import Foundation

class NetworkingManagerUsersResponseFailureMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
    
    func request(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint) async throws {
        
    }
    
    
}

#endif
