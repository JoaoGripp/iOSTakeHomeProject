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
    @Published private(set) var isLoading = false
    @Published var hasError = false
    
    private let networkingManager: NetworkingManagerImpl!
    
    init(networkingManager: NetworkingManagerImpl = NetworkingManager.shared) {
        self.networkingManager = networkingManager
    }
    
    @MainActor
    func fetchDetails(for id: Int) async {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            self.userInfo = try await networkingManager.request(session: .shared,
                                                                .detail(id: id),
                                                                type: UserDetailResponse.self)
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}
