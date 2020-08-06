//
//  Endpoint.swift
//  GiftCard
//
//  Created by Mehdi Mirzaie on 4/28/19.
//  Copyright © 2019 Yaramobile. All rights reserved.
//

import Foundation

/**
 A protcol for defining endpoints
 Creating new enpoint required to adopt to this protocol
 The only required property is the path
*/
protocol Endpoint {
    
    /// Base Url of the endpoint. Defaull value defined in AppUrls
    var baseUrl : String { get }
    
    /// Path of the endpoint
    var path : String { get }
    
    /// Http method of the request default if Get
    var httpMethod : HTTPMethod { get }
    
    /// Headers of the HTTP request. default is empty
    var headers : [String : String]? { get }
    
    /// Url quey params
    var queryParameters : [URLQueryItem]? { get }
    
    /// Body of the request. deafult is nil
    var body : Data? { get }
    
}

extension Endpoint{
    
    var httpMethod : HTTPMethod{
        return .GET
    }
    
    var baseUrl : String {
        return AppUrls.baseUrl
    }
    
    var headers : [String :String]? {
        
        let allHeaders = [String :String]()
        
        return allHeaders
    }
    
    var queryParameters : [URLQueryItem]?{
        return nil
        
    }
    
    var body : Data?{
        return nil
    }
    
    var urlComponents : URLComponents?{
        var component = URLComponents(string: baseUrl)
        
        
        component?.path = AppUrls.Routes.api + path
        component?.queryItems = queryParameters
        
        return component
        
    }
    
    var request : URLRequest{
        var request = URLRequest(url: (urlComponents?.url!)!)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        request.allHTTPHeaderFields = headers
        return request
    }
}
