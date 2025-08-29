//
//  StateDemoViewTests.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 8/28/25.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import SwiftUI_Combine

class StateDemoViewTests: XCTestCase {
    
    func testInitialState() throws {
        let view = StateDemoView()
        let button = try view.inspect().vStack().button(2)
        
        XCTAssertEqual(try button.labelView().text().string(), "Toggle")
    }
    
    func testViewStructure() throws {
        let view = StateDemoView()
        let vstack = try view.inspect().vStack()
        
        XCTAssertNoThrow(try vstack.image(0))
        XCTAssertNoThrow(try vstack.spacer(1))
        XCTAssertNoThrow(try vstack.button(2))
    }
}
