//
//  MockNetworkSwiftTests.swift
//  MockNetworkSwiftTests
//
//  Created by Mehdi on 8/6/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import XCTest
@testable import MockNetworkSwift

class MockNetworkSwiftTests: XCTestCase {

   let mockViewModel = HomeViewModel(network: MockNetwork())
    
    
    func testComments(){
        let asyncExpectation = expectation(description: "Async comments block  executed")
        
        
        mockViewModel.commentData = { (comments) in
            
            //Comment With id = (\($0.id) and text = \($0.text)
            XCTAssert(comments[0] == "Comment With id = 1 and text = A",   "First comment test failed")
            
            XCTAssert(comments[1] == "Comment With id = 2 and text = B",   "Second comment test failed")
            asyncExpectation.fulfill()
        }
        
        mockViewModel.getComments()
        waitForExpectations(timeout: 1, handler: nil)

    }
    
    func testHome(){
        let asyncExpectation = expectation(description: "Async home block  executed")
       
        
        mockViewModel.homeData = { (home) in
            
            //Comment With id = (\($0.id) and text = \($0.text)
            XCTAssert(home == "Home item With id = 1 and title = Sample 1",   "Home data test failed")
            
            asyncExpectation.fulfill()
        }
        
        mockViewModel.getHome()
        waitForExpectations(timeout: 1, handler: nil)

    }

}
