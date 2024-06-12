//
//  ButtonType.swift
//  Calculator
//
//  Created by Paul Makey on 12.06.24.
//

import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case negative
    case percent
    case decimal
    case equal
    case clear
    
    var description: String {
        switch self {
            case .digit(let digit):
                return digit.description
            case .operation(let operation):
                return operation.description
            case .negative:
                return "+/-"
            case .percent:
                return "%"
            case .decimal:
                return "."
            case .equal:
                return "="
            case .clear:
                return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
            case .clear:
                return Color(hex: 0xFF5959)
            case .equal:
                return Color(hex: 0x66FF7F)
            default:
                return Color(hex: 0x343434)
        }
    }
    
    var foregroundColor: Color {
        switch self {
            case .percent, .operation(.division), .operation(.multiplication), .operation(.subtraction), .operation(.addition):
                return Color(hex: 0x66FF7F)
            case .clear, .equal:
                return Color(hex: 0x343434)
            default:
                return Color(hex: 0xFFFFFF)
        }
    }
}
