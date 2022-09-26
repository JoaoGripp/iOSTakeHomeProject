//
//  UsersResponse.swift
//  iOSTakeHomeProject
//
//  Created by Joao Gripp on 26/09/22.
//

import Foundation

// MARK: - UsersResponse
struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
