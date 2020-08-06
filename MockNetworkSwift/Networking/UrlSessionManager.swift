//
//  UrlSessionManager.swift
//  MockNetworkSwift
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

// We use final access level because there is no intent for override this class. So this class uses Static Method Dispatch.

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
    
    
    // MARK: - Protocol method implemention
    
    func getHomeFeed(completion: @escaping (Result<HomeItem, Error>) -> Void) {
        
    }
    
    func getComments(withPostId postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        
    }
    
  
    
}

