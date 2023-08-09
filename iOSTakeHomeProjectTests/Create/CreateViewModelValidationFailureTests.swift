//
//  CreateViewModelFailureTests.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 09/08/23.
//

import XCTest
@testable import iOSTakeHomeProject

final class CreateViewModelValidationFailureTests: XCTestCase {

    private var networkingMock: NetworkingManagerImpl!
    private var validationMock: CreateValidatorImpl!
    private var vm: CreateViewModel!
    
    override func setUp() async throws {
        networkingMock = NetworkingManagerCreateSuccessMock()
        validationMock = CreateValidatorFailureMock()
        vm = CreateViewModel(networkingManager: networkingMock, validator: validationMock)
    }
    
    override func tearDown() {
        networkingMock = nil
        validationMock = nil
        vm = nil
    }
    
    func test_with_invalid_form_submission_state_is_invalid() async throws {
        
        XCTAssertNil(vm.state, "The view model state should be nil initially")
        defer {
            XCTAssertEqual(vm.state, .unsuccessful, "The view model state should be unsuccessful")
        }
        
        await vm.create()
        
        XCTAssertTrue(vm.hasError, "The view model should have an error")
        XCTAssertNotNil(vm.error, "The view model error property should not be nil")
        XCTAssertEqual(vm.error, .validation(error: CreateValidator.CreateValidatorError.invalidFirstName), "The view model error should be invalid first name")
        
    }

}
