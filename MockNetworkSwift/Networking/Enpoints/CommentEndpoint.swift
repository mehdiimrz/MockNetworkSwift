//
//  CommentEndpoint.swift
//  MockNetworkSwift
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

/// Endpoint for requesting Comments
struct CommentEndpoint : Endpoint{
    
    var path: String{
        
        return "/comments"
    }
}
