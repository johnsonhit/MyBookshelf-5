//
//  NewBooksResponseTest.swift
//  SendBirdTests
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import XCTest
@testable import SendBird

class NewBooksResponseTest: XCTestCase {

    func testNewBooksResponse() {
        let jsonData = grabJsonData(for: "MockNewBooksResponse")
        let newBooksResponse = try! JSONDecoder().decode(NewBooksResponse.self, from: jsonData)
        XCTAssertNotNil(newBooksResponse)
    }

}
