//
//  UserDetailResponse.swift
//  iOSTakeHomeProject
//
//  Created by Joao Gripp on 26/09/22.
//


import Foundation

// MARK: - UserDetailResponse
struct UserDetailResponse: Codable {
    let data: User
    let support: Support
}
