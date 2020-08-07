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
    
    func getHomeFeed(completion: @escaping (Result<HomeItem, ServerError>) -> Void) {
        
        let homeEndpoint = HomeEndpoint()
        fetch(endpoint: homeEndpoint) { (result : Result<HomeItem, ServerError>) in
            completion(result)
        }
        
    }
    
    func getComments(withPostId postId: Int, completion: @escaping (Result<[Comment], ServerError>) -> Void) {
        
        let comentEndpoint = CommentEndpoint(postId: postId)
        fetch(endpoint: comentEndpoint) { (result : Result<[Comment], ServerError>) in
            completion(result)
        }
    }
    
  
    
}

extension UrlSessionManager {
    
    /**
       Send the request using UrlSession

       - Parameters:
          - endpoint: Endpoint object
          - completion: Completion handler returning ResultType
     

       - Returns: A UrlSessionManager which can handle requests
       */
    func fetch<V: Codable>(endpoint : Endpoint, completion : @escaping ((Result<V,ServerError>) -> Void)){
        
        
        let task = self.session.dataTask(with: endpoint.request) { (data , response ,error) in
            
            guard error == nil else {
                completion (.failure(.unknownError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                completion(.failure(.unknownError))
                return
            }
            
            
            guard 200..<300 ~= response.statusCode else {
                completion(.failure(.init(code: response.statusCode)))
                return
            }
            
            do{
                guard let data = data else{
                    completion(.failure(.unknownError))
                    return
                }
                
                let value = try JSONDecoder().decode(V.self, from: data)
                completion(.success(value))
                
            } catch{
                
                completion(.failure(.customError("Decoding Error")))
            }
        }
        task.resume()
    }
    
}



