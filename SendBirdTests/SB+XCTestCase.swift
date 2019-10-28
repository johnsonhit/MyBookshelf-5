//
//  SB+XCTestCase.swift
//  SendBirdTests
//
//  Created by Jonathan on 10/27/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import XCTest

extension XCTestCase {
    func grabJsonData(for jsonName: String) -> Data {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: jsonName, ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }


        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
        return jsonData
    }
}
