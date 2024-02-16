//
//  NotePadiOSTests.swift
//  NotePadiOSTests
//
//  Created by Juhee Kang Johansson on 2024-02-14.
//
/*
import XCTest
@testable import NotePadiOS

final class NotePadiOSTests: XCTestCase {

    var listView: ListView!
    
    override func setUpWithError() throws {
        listView = ListView()
    }

    override func tearDownWithError() throws {
        listView = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddNumbersReturnsSum(){
        
        //arrange
        let a = 2
        let b = 3
        let expected = 5
        
        //action
        let actualResult = listView.addNumbers(a: a, b: b)
        
        //assert
        XCTAssertEqual(expected, actualResult, "actualResult should be \(a+b)")
        //XCTAssert(expected == actualResult)
    }
    
    func testReturnSquare() {
        //arrange
        let number = 10
        let expected = 100
        //action
        let actualResult = listView.returnSquared(number: number)
        //assert
        XCTAssert(expected, actualResult, "actualResult should be \(String(number * number))")
    }
    
    func testDivideNumber() {
        //arrange
        let a = 5
        let b = 2
        let expected = 2.5
        
        //action
        let actualResult = listView.divideNumbers(a: a, b: b)
        
        //assert
        XCTAssertEqual(expected, actualResult, "actualResult should be \(Double(a)/Double(b))")
    }
    
    func testAddNumbersMultipleCases() {
        let testCases: [(a: Int, b: Int, expected: Int)] = [
        (1,2,3),
        (-1,1,0),
        (10,0,10),
        (0,0,0)
        ]
        
        for testCase in testCases {
            XCTAssertEqual(listView.addNumbers(a: testCase.a, b: testCase.b), testCase.expected, "\(testCase.a) + \(testCase.b) should be equal to \(testCase.expected)")
        }
        
    }
}
*/
