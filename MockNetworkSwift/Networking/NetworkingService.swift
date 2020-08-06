//
//  NetworkingService.swift
//  MockNetwork
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

/// An interface for implementing network functions
protocol NetworkingService {
    
    /**
    Get home object

    - Parameters:
       - completion: Return HomeItem in Result
    */
    func getHomeFeed(completion: @escaping (Result<HomeItem, ServerError>)->Void)
    
    
    /**
    Get comments of post by postID

    - Parameters:
       - postId: Identifier of a post
       - completion: Return list of Comments in Result
    */
    func getComments(withPostId postId : Int, completion: @escaping (Result<[Comment], ServerError>)->Void )

}
