//
//  ContentView.swift
//  Calculator
//
//  Created by Paul Makey on 10.06.24.
//

import SwiftUI

enum CalculatorButton: String, CaseIterable {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case mutliply = "x"
    case equal = "="
    case clear = "C"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var buttonTitleColor: Color {
        switch self {
            case .percent, .divide, .mutliply, .subtract, .add:
                return Color(hex: 0x66FF7F)
            case .clear, .equal:
                return Color(hex: 0x343434)
            default:
                return Color(hex: 0xFFFFFF)
        }
    }
    
    var buttonColor: Color {
        switch self {
            case .clear:
                return Color(hex: 0xFF5959)
            case .equal:
                return Color(hex: 0x66FF7F)
            default:
                return Color(hex: 0x343434)
        }
    }
}

struct ContentView: View {
    var body: some View {
        HStack {
            CustomButton(title: "1")
        }
    }
    
    /// - Custom Calculator Button
    @ViewBuilder func CustomButton(title: String) -> some View {
        Text(title)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(. 
            }
    }
}

#Preview {
    ContentView()
}
