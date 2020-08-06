//
//  UrlSessionManager.swift
//  MockNetworkSwift
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

/// This manager handles requests using NSUrlSession
final class UrlSessionManager : NetworkingService{
    
    
    /// session manager
    private let session : URLSession
    
    /**
    Initializes a new UrlSessionManager with the provided session.

    - Parameters:
       - session: The UrlSession default is URLSession.shared

    - Returns: A UrlSessionManager which can handle requests
    */
    init (session : URLSession = URLSession.shared){
        self.session = session
    }
    
    
    func getHomeFeed(completion: @escaping (Result<HomeItem, Error>) -> Void) {
        
    }
    
    func getComments(withPostId postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        
    }
    
  
    
}

