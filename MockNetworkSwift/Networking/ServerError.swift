//
//  ServerError.swift
//  MockNetworkSwift
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

/// This enum contains errors returned from http request
enum ServerError : Error {
    case badRequest
    case unknownError
    case forbidden
    case invalidCredentials
    case notFound
    case serverError
    
    
    /**
    Inititlize an error object based on the HTTP status code

    - Parameters:
       - code: HTTP status code
    */
    init (code : Int){
        
        switch code {
        case 400:
            self = .badRequest
        case 402:
            self = .invalidCredentials
        case 430:
            self = .forbidden
        case 404:
            self = .notFound
        case 500:
            self = .serverError
        default:
            self = .unknownError
        }
    }
}


extension ServerError: LocalizedError {
    
    
    var errorDescription: String? {
        switch self {
        case .badRequest: return "Bad Request"
        case .unknownError: return "Unknown error"
        case .forbidden: return "Frobidden"
        case .invalidCredentials: return "Invalid Credentials"
        case .notFound: return "Not Found"
        case .serverError: return "Server Error"
        }
    }
    
}
