//
//  CalculatorView.swift
//  Calculator
//
//  Created by Paul Makey on 10.06.24.
//

import SwiftUI

enum Operation {
    case add
    case subtract
    case multiply
    case divide
    case none
}

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

struct CalculatorView: View {
    
    @State private var value = "0"
    @State private var history = ""
    @State private var runningNumber = "0"
    
    @State private var currentOperation: ((_ numberOne: Double, _ numberTwo: Double) -> (Double))? = nil
    @State private var numbers = [0.0, 0.0]
    @State private var currentNumberIndex = 0
    
    private let calculatorOperations: [CalculatorButton: (_ numberOne: Double, _ numberTwo: Double) -> (Double)] =
    [
        .add: { $0 + $1 },
        .subtract: { $0 - $1 },
        .mutliply: { $0 * $1 },
        .divide: {$0 / $1 }
    ]
    
    private let calculatorButtons: [[CalculatorButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                HStack(spacing: 20) {
                    Spacer()
                    
                    Text(history)
                        .padding(.top, 20)
                        .padding(.trailing, 16)
                        .font(.system(size: 48))
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Divider()
                
                ForEach(calculatorButtons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button {
                                switch button {
                                    case .add, .subtract, .mutliply, .divide:
                                        operationButtonDidTapped(button)
                                    case .equal:
                                        history = "Hello, World!"
                                    default:
                                        numberButtonDidTapped(button)
                                    }
                            } label: {
                                Text(button.rawValue)
                                    .font(.system(size: 36))
                                    .foregroundStyle(button.buttonTitleColor)
                                    .frame(
                                        width: buttonWidth(button: button),
                                        height: buttonHeight()
                                    )
                                    .background {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(button.buttonColor)
                                    }
                            }
                        }
                    }
                }
                .padding(.bottom, 3)
            }
        }
    }
    
    private func operationButtonDidTapped(_ button: CalculatorButton) {
        currentOperation = calculatorOperations[button]
        history.append(button.rawValue)
        numbers[currentNumberIndex] = Double(runningNumber) ?? 0
        currentNumberIndex = currentNumberIndex == 0 ? 1 : 0
        runningNumber = ""
    }
    
    private func numberButtonDidTapped(_ button: CalculatorButton) {
        history.append(button.rawValue)
        runningNumber.append(button.rawValue)
    }
    
    private func equalButtonDidTapped(_ button: CalculatorButton) {
        
    }
    
    private func specialButtonDidTapepd(_ button: CalculatorButton) {
        
    }
    
    // Calculating Button Size Depending on the Screen Size
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        /// Logic behind the calculations:
        /// - UIScreen.main.bounds.width – Taking width of the Screen
        /// - (4 * 12) – Subtract the Padding of the Each Column
        /// - / 4 – Dividing by the Columns We Have
        if button == .equal {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}


#Preview {
    CalculatorView()
}
