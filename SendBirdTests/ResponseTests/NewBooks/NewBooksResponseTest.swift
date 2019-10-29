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
        let totalBooks = newBooksResponse.total
        XCTAssertEqual(totalBooks, 2)
        let books = newBooksResponse.books
        XCTAssertEqual(books.count, 2)
        let designingSensesBook = books.first!
        let expectedTitle = "Designing Across Senses"
        XCTAssertEqual(designingSensesBook.title, expectedTitle)
        let expectedSubTitle = "A Multimodal Approach to Product Design"
        XCTAssertEqual(designingSensesBook.subtitle, expectedSubTitle)
        let expectedISBN13 = "9781491954249"
        XCTAssertEqual(designingSensesBook.isbn13, expectedISBN13)
        let expectedImageString = "https://itbook.store/img/books/9781491954249.png"
        XCTAssertEqual(designingSensesBook.image, expectedImageString)
        let expectedURLString = "https://itbook.store/books/9781491954249"
        XCTAssertEqual(designingSensesBook.url, expectedURLString)
    }

}
