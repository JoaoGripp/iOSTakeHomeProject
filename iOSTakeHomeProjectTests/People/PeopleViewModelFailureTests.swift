//
//  PeopleViewModelFailureTests.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 04/08/23.
//

import XCTest
@testable import iOSTakeHomeProject

final class PeopleViewModelFailureTests: XCTestCase {

    private var networkingMock: NetworkingManagerImpl!
    private var vm: PeopleViewModel!
    
    override func setUp() {
        networkingMock = NetworkingManagerUsersResponseFailureMock()
        vm = PeopleViewModel(networkingManager: networkingMock)
    }
    
    override func tearDown() {
        networkingMock = nil
        vm = nil
    }
    
    func test_with_unsuccessful_response_error_is_handle() async {
        
        XCTAssertFalse(vm.isLoading, "The View model should not be loading any data")
        defer {
            XCTAssertFalse(vm.isLoading, "The View model should not be loading any data")
            XCTAssertEqual(vm.viewState, .finished, "The view model state should be finished")
        }
        await vm.fetchUsers()
        
        XCTAssertTrue(vm.hasError, "The view model should have an error")
        XCTAssertNotNil(vm.error, "The view model error should be set")
    }

}
