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
    
    private var postId : Int
    
    init(postId : Int){
        self.postId = postId
    }
    
    var path: String{
        
        return "/comments"
    }
    
    var queryParameters: [URLQueryItem]?{
        
        return [URLQueryItem(name: "postId", value: "\(postId)")]
        
    }
}
