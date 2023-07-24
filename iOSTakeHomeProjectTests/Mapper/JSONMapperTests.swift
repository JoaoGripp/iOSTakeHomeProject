//
//  JSONMapperTests.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 24/07/23.
//

import Foundation
import XCTest
@testable import iOSTakeHomeProject

class JSONMapperTests: XCTestCase {
    
    func test_with_valid_json_successfully_decodes() {
        XCTAssertNoThrow(try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self), "Mapper should not throw an error")
        
        let userResponse = try? StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        XCTAssertNotNil(userResponse, "User response should not be nil")
        
        XCTAssertEqual(userResponse?.page, 1, "Page number should be 1")
        XCTAssertEqual(userResponse?.perPage, 6, "PerPage number should be 6")
        XCTAssertEqual(userResponse?.total, 12, "Total number should be 12")
        XCTAssertEqual(userResponse?.totalPages, 2, "TotalPages number should be 2")
        
        XCTAssertEqual(userResponse?.data.count, 6, "Total number should be 6")
        
        XCTAssertEqual(userResponse?.data[0].id, 1, "The id should be 1")
        XCTAssertEqual(userResponse?.data[0].email, "george.bluth@reqres.in", "The email should be george.bluth@reqres.in")
        XCTAssertEqual(userResponse?.data[0].firstName, "George", "The firstname should be George")
        XCTAssertEqual(userResponse?.data[0].lastName, "Bluth", "The lastname should be Bluth")
        XCTAssertEqual(userResponse?.data[0].avatar, "https://reqres.in/img/faces/1-image.jpg", "The avatar address should be https://reqres.in/img/faces/1-image.jpg")
        
    }
    
    func test_with_missing_file_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "", type: UsersResponse.self), "An error should be thrown")
        
        do {
            _ = try StaticJSONMapper.decode(file: "", type: UsersResponse.self)
        } catch {
                guard let mappingError = error as? StaticJSONMapper.MappingError else {
                    XCTFail("This is the wrong type of error for missing files")
                    return
                }
                XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
        }
    }
    
    func test_with_invalid_file_name_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "dfddf", type: UsersResponse.self), "An error should be thrown")
        
        do {
            _ = try StaticJSONMapper.decode(file: "dfddf", type: UsersResponse.self)
        } catch {
                guard let mappingError = error as? StaticJSONMapper.MappingError else {
                    XCTFail("This is the wrong type of error for missing files")
                    return
                }
                XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
        }
    }
    
    func test_with_invalid_json_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self), "An error should be thrown")
        
        do {
            _ = try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self)
        } catch {
            if error is StaticJSONMapper.MappingError {
                XCTFail("Got the wrong type of error, expecting a system decoding error")
            }
        }
    }
}
