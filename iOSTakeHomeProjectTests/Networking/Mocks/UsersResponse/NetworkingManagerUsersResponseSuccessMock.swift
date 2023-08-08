//
//  NetworkingManagerUsersResponseSuccessMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 03/08/23.
//

import Foundation
@testable import iOSTakeHomeProject

class NetworkingManagerUsersResponseSuccessMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self) as! T
    }
    
    func request(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint) async throws {
        
    }
    
    
}
