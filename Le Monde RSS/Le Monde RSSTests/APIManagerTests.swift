//
//  APIManagerTests.swift
//  Le Monde RSSTests
//
//  Created by Jeremy Benabu on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import XCTest
@testable import Le_Monde_RSS

class APIManagerTests: XCTestCase {

    func testRetrieveNewsFeed() {
        let expectation = self.expectation(description: "API Reponse")

        APIManager.retrieveNewsFeed(Constants().baseUrl) { (result) in
            switch result {
            case .success(object: let channel):
                XCTAssertTrue(channel.items.count > 0)
                XCTAssertNotNil(channel.title)
                expectation.fulfill()
            case .error(e: let error):
                XCTFail("error api: \(error)")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
