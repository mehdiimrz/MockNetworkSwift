//
//  MockNetwork.swift
//  MockNetworkSwift
//
//  Created by Mehdi-Mac on 8/11/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

final class MockNetwork : NetworkingService{
    
    func getHomeFeed(completion: @escaping (Result<HomeItem, ServerError>) -> Void) {
        
        let jsonString = "{\"title\": \"Sample 1\" , \"id\" : 1}"
        let jsonData = Data(jsonString.utf8)
        let homeObject = try! JSONDecoder().decode(HomeItem.self, from: jsonData)
        
        completion(.success(homeObject))
        
    }
    
    func getComments(withPostId postId: Int, completion: @escaping (Result<[Comment], ServerError>) -> Void) {
        
        let jsonString = "[{\"id\" : 1, \"text\":\"A\"},{\"id\":2 , \"text\" : \"B\"}]"
        let jsonData = Data(jsonString.utf8)
        let commentObjects = try! JSONDecoder().decode([Comment].self, from: jsonData)
        
        completion(.success(commentObjects))
    }
    
    


}
