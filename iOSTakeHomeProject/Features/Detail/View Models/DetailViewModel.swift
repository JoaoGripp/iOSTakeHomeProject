//
//  DetailViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Joao Gripp on 29/12/22.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published private(set) var userInfo: UserDetailResponse?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    func fetchDetails(for id: Int) {
        
        NetworkingManager.shared.request("https://reqres.in/api/users/\(id)x",
            type: UserDetailResponse.self) { [weak self] res in
            DispatchQueue.main.async {
                switch res {
                case .success(let response):
                    self?.userInfo = response
                case .failure(let error):
                    self?.hasError = true
                    self?.error = error as? NetworkingManager.NetworkingError
                }
            }
        }
        
    }
}
