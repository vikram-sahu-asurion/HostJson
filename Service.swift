//
//  Service.swift
//  Axxess-Code-Challenge
//
//  Created by Vikram Sahu on 04/07/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import Foundation

/**
 A generic service handler parameterized by domain & error models.
 
 - Parameter T: The domain model this service returns
 - Parameter E: The service error which is returned
 */

typealias ServiceCompletion<T, E> = (ServiceResult<T, E>) -> Void

typealias ResponseCompletion<T: Codable> = ServiceCompletion<ViewModel, ServiceError>

enum ServiceResult<T, E> {
    
    /**
     Asserts that the service operation successfully completed.
     
     Contains a domain model
     */
    case success(domainModel: T)
    
    /**
     Asserts that the service operation failed for some reason.
     
     Contains an error model describing the failure.
     */
    case failure(error: E)
}
