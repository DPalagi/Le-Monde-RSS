//
//  APIManagerTests.swift
//  Le Monde RSSTests
//
//  Created by dpalagi on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import XCTest
@testable import Le_Monde_RSS

class APIManagerTests: XCTestCase {

    func testRetrieveNewsFeed_OK() {
        let expectation = self.expectation(description: "API Reponse - OK")

        APIManager.fetchNewsFeed(Constants().baseUrl) { (result) in
            switch result {
            case .success(object: let channel):
                XCTAssertTrue(channel.items.count > 0)
                XCTAssertNotNil(channel.title)
                expectation.fulfill()
            case .error(e: let error):
                XCTFail("API error: \(error)")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFeedNewsEncoding_OK() {
        let expectation = self.expectation(description: "Encoding response is UTF-8")

        APIManager.fetchNewsFeed(Constants().baseUrl) { (result) in
            switch result {
            case .success(object: let channel):
                XCTAssertTrue(channel.title == "Le Monde.fr - Actualités et Infos en France et dans le monde")
                expectation.fulfill()

            case .error(e: let error):
                XCTFail("API error \(error)")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFeedNewsImageUrl_OK() {
        let expectation = self.expectation(description: "Image URL is not empty")

        APIManager.fetchNewsFeed(Constants().baseUrl) { (result) in
            switch result {
            case .success(object: let channel):
                XCTAssertNotNil(channel.items[0].image?.imageUrl)
                expectation.fulfill()
            case .error(e: _):
                XCTFail("News image URL is empty")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
