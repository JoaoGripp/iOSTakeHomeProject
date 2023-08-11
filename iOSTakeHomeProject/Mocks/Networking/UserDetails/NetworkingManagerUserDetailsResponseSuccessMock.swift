//
//  NetworkingManagerUserDetailsResponseSuccessMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 08/08/23.
//

#if DEBUG

import Foundation

class NetworkingManagerUserDetailsResponseSuccessMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return try StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self) as! T
    }
    
    func request(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint) async throws {
        
    }
    
    
    
}

#endif
