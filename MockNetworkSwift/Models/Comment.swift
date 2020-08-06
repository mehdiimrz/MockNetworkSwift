//
//  Comment.swift
//  MockNetwork
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

/// This object contains information about comment
struct Comment : Codable{
    
    /// Text content of the object
    let text : String
    
    /// Identifier of the object
    let id : Int
    
}
