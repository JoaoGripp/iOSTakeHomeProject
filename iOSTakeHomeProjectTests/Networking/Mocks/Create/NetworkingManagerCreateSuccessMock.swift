//
//  NetworkingManagerCreateSuccessMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 09/08/23.
//

import Foundation
@testable import iOSTakeHomeProject

class NetworkingManagerCreateSuccessMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return Data() as! T
    }
    
    func request(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint) async throws {}
}
