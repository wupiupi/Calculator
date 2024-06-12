//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Paul Makey on 12.06.24.
//

import Foundation

/// I'm making it's as extension because we don't use Calculator View Model
/// separate of the CalculatorView
extension CalculatorView {
    final class ViewModel: ObservableObject {
        @Published var calculator = Calculator()
        @Published var isOperationButtonTapped = false
        
        var displayText: String {
            calculator.displayText
        }
        
        var history: String {
            calculator.history
        }
        
        let calculatorButtons: [[ButtonType]] = [
            [.clear, .negative, .percent, .operation(.division)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
            [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
            [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
            [.digit(.zero), .decimal, .equal]
        ]
        
        func buttonDidTapped(_ buttonType: ButtonType) {
            switch buttonType {
                case .digit(let digit):
                    calculator.setDigit(digit)
                case .operation(let operation):
                    calculator.setOperation(operation)
                case .negative:
                    calculator.toggleSign()
                case .percent:
                    calculator.setPercent()
                case .decimal:
                    calculator.setDecimal()
                case .equal:
                    calculator.evaluate()
                    isOperationButtonTapped = true
                case .clear:
                    calculator.clear()
                    isOperationButtonTapped = false
            }
        }
        
        /// Checks if current buttonType of type .arithmeticOperation is active
        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
            guard case .operation(let operation) = buttonType else { return false }
            return calculator.operationIsHighlighted(operation)
        }
    }
}
