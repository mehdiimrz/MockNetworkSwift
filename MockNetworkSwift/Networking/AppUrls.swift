//
//  AppUrls.swift
//  MockNetworkSwift
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

/// Contains urls
public struct AppUrls {
    
    /// Domains
    private struct Domains{
        static let server = "{Sever_URL}"
        static let local = "{Local_URL}"
    }
    
    /// Routes which added to the domain
    private struct Routes{
        static let api = "/api"
    }
    
    
    public static let domain = Domains.server
    
    /// App base url
    public static let baseUrl = domain + Routes.api
    
    
}
