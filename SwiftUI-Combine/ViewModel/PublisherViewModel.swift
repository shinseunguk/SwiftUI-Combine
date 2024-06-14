//
//  PublisherViewModel.swift
//  SwiftUI-Combine
//
//  Created by ukseung.dev on 6/13/24.
//

import Foundation
import Combine

enum PublisherError: Error {
    case castingError
    case negativeError
    case remainingError
    
    var errorMessage: String {
        switch self {
        case .castingError:
            return "캐스팅 실패 🚨"
        case .negativeError:
            return "음수 입력 입니다. 🚨\n양수로 입력 해주세요. "
        case .remainingError:
            return "에러 발생. 🚨"
        }
    }
}

final class PublisherViewModel: ObservableObject, ViewModel {
    
    @Published var totalSum: Int = 0
    @Published var shownError: Bool = false
    @Published var errorMessage: String = ""
    
    // Input
    let buttonPress = PassthroughSubject<Any, PublisherError>()
    
    // Output
    private let currentValue = CurrentValueSubject<Int, Never>(0)
    private let shownErrorSubject = PassthroughSubject<Bool, Never>()
    private let errorMessageSubject = PassthroughSubject<PublisherError, Never>()
    
    var cancellables: [AnyCancellable] = []
    
    enum Input {
        case buttonPress(_ inputValue: Any)
    }
    
    func apply(_ input: Input) {
        switch input {
        case .buttonPress(let value):
            self.buttonPress.send(value)
        }
    }
    
    init() {
        bindInput()
        bindOutput()
    }
    
    func bindInput() {
        let buttonPressPublisher = buttonPress
            .tryMap { value in
                guard let stringValue = value as? String,
                      let value = Int(stringValue) else {
                    throw PublisherError.castingError
                }
                
                if value < 0 {
                    throw PublisherError.negativeError
                }
                
                return value
            }
            .sink { completion in
                switch completion {
                case .failure(let error):
                    guard let error = error as? PublisherError else {
                        self.errorMessageSubject.send(.remainingError)
                        return
                    }
                    print(error.errorMessage)
                    
                    self.shownErrorSubject.send(true)
                    self.errorMessageSubject.send(error)
                case .finished:
                    print("finished")
                    break
                }
            } receiveValue: {
                let newValue = self.currentValue.value + $0
                self.currentValue.send(newValue)
            }
        
        cancellables += [
            buttonPressPublisher
        ]
    }
    
    func bindOutput() {
        let currenValueStream = currentValue
            .assign(to: \.totalSum, on: self)
        
        let shownErrorStream = shownErrorSubject
            .assign(to: \.shownError, on: self)
        
        let errorMessageStream = errorMessageSubject
            .map { error in
                error.errorMessage
            }
            .assign(to: \.errorMessage, on: self)
        
        cancellables += [
            currenValueStream,
            shownErrorStream,
            errorMessageStream
        ]
    }
}
