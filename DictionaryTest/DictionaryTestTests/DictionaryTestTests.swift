//
//  DictionaryTestTests.swift
//  DictionaryTestTests
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import XCTest

@testable import DictionaryTest

class DictionaryTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testSearchResultsWithResponse() {
        let viewModel = SearchWordsViewModel()
        let responseObjects = Array<WordRO>(JSONString: MockResponses.responseString)!

        let searchResult = viewModel.searchResultsWithResponse(response: responseObjects)
        
        XCTAssertTrue(searchResult[0].meanings[0].text == "очевидно")
    }
}
