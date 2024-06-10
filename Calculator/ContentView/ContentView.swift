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
                Spacer()
                
                ForEach(calculatorButtons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button {
                                print(button.rawValue)
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
            }
        }
    }
    
    // Calculating Button Size Depending on the Screen Size
    func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .equal {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

#Preview {
    ContentView()
}
