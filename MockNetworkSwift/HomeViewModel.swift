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
    public var homeData : ((HomeItem)->Void)?
    
    /// This closure will call after the viewmodel received comments object successfully
    public var commentData : (([Comment])->Void)?
    
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
                    self.homeData?(home)
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
                    self.commentData?(commnets)
                case .failure(let error):
                    self.error?(error)
                }
            }
        }
    }
    
}
