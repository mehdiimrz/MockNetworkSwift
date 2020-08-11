//
//  HomeViewModel.swift
//  MockNetworkSwift
//
//  Created by Mehdi-Mac on 8/10/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation


/// Viewmodel for Home
class HomeViewModel{
    
    private let network : NetworkingService
    
    /// This closure will call after the viewmodel received homeItem object successfully
    public var homeData : ((String)->Void)?
    
    /// This closure will call after the viewmodel received comments object successfully
    public var commentData : (([String])->Void)?
    
    /// This closure will be called when any error occured
    public var error : ((Error)->Void)?
    
    init(network : NetworkingService){
        
        self.network = network
        
    }
    
    /// Receive home data
    func getHome(){
        
        network.getHomeFeed { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let home):
                    let returnString = "Home item With id = \(home.id) and title = \(home.title)"
                    self.homeData?(returnString)
                case .failure(let error):
                    self.error?(error)
                }
            }
            
        }
        
    }
    
    /// Receive comment data
    func getComments(){
        
        network.getComments(withPostId: 1) { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let commnets):
                    
                    let commentsString = commnets.map { "Comment With id = \($0.id) and text = \($0.text)" }
                    
                    self.commentData?(commentsString)
                case .failure(let error):
                    self.error?(error)
                }
            }
        }
    }
    
}
