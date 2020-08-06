//
//  HomeItem.swift
//  MockNetwork
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

/// Every item in home screen is a HomeItem
struct HomeItem : Codable{
    
    /// Title of the object
    let title : String
    
    /// Identifier of the object
    let id : Int
    
}
