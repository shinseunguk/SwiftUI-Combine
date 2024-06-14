//
//  ViewModel.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 6/13/24.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    func apply(_ input: Input)
}
