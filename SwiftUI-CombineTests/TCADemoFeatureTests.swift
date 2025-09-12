//
//  TCADemoFeatureTests.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 9/9/25.
//

import XCTest
import ComposableArchitecture

@testable import SwiftUI_Combine

@MainActor
class TCADemoFeatureTests: XCTestCase {
    
    func testIncrement() async {
        let store = TestStore(initialState: TCADemoFeature.State()) {
            TCADemoFeature()
        }
        
        await store.send(.increment) {
            $0.count = 1
        }
    }
    
    func testDecrement() async {
        let store = TestStore(initialState: TCADemoFeature.State(count: 5)) {
            TCADemoFeature()
        }
        
        await store.send(.decrement) {
            $0.count = 4
        }
    }
    
    func testReset() async {
        let store = TestStore(initialState: TCADemoFeature.State(count: 10)) {
            TCADemoFeature()
        }
        
        await store.send(.reset) {
            $0.count = 0
        }
    }
    
    func testMultipleIncrements() async {
        let store = TestStore(initialState: TCADemoFeature.State()) {
            TCADemoFeature()
        }
        
        await store.send(.increment) {
            $0.count = 1
        }
        
        await store.send(.increment) {
            $0.count = 2
        }
        
        await store.send(.increment) {
            $0.count = 3
        }
    }
    
    func testIncrementThenReset() async {
        let store = TestStore(initialState: TCADemoFeature.State()) {
            TCADemoFeature()
        }
        
        await store.send(.increment) {
            $0.count = 1
        }
        
        await store.send(.reset) {
            $0.count = 0
        }
    }
    
    func testDecrementFromZero() async {
        let store = TestStore(initialState: TCADemoFeature.State(count: 0)) {
            TCADemoFeature()
        }
        
        await store.send(.decrement) {
            $0.count = -1
        }
    }
    
    func testInitialState() {
        let initialState = TCADemoFeature.State()
        XCTAssertEqual(initialState.count, 0)
    }
    
    func testStateEquatable() {
        let state1 = TCADemoFeature.State(count: 5)
        let state2 = TCADemoFeature.State(count: 5)
        let state3 = TCADemoFeature.State(count: 3)
        
        XCTAssertEqual(state1, state2)
        XCTAssertNotEqual(state1, state3)
    }
    
    func testAllActionsCaseIterable() {
        let allActions = TCADemoFeature.Action.allCases
        XCTAssertEqual(allActions.count, 3)
        XCTAssertTrue(allActions.contains(.increment))
        XCTAssertTrue(allActions.contains(.decrement))
        XCTAssertTrue(allActions.contains(.reset))
    }
}
