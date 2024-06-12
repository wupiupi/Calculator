//
//  ArithmeticOperation.swift
//  Calculator
//
//  Created by Paul Makey on 12.06.24.
//

import Foundation

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    case addition
    case subtraction
    case multiplication
    case division
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "−"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}
