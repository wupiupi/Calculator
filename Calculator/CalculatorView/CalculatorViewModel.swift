//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Paul Makey on 12.06.24.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    @Published var calculator = Calculator()
    
    var displayedText: String {
        calculator.displayText
    }
    
    let calculatorButtons: [[ButtonType]] = [
        [.clear, .negative, .percent, .operation(.division)],
        [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
        [.digit(.six), .digit(.five), .digit(.four), .operation(.subtraction)],
        [.digit(.three), .digit(.two), .digit(.one), .operation(.addition)],
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
            case .clear:
                calculator.clear()
        }
    }
    
    /// Checks if current buttonType of type .arithmeticOperation is active
    func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
        guard case .operation(let operation) = buttonType else { return false }
        return calculator.operationIsHighlighted(operation)
    }
}
