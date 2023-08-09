//
//  CreateValidatorSuccessMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Joao Gripp on 09/08/23.
//

import Foundation
@testable import iOSTakeHomeProject

struct CreateValidatorSuccessMock: CreateValidatorImpl {
    func validate(_ person: iOSTakeHomeProject.NewPerson) throws {}
    
    
}
