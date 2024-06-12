//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Paul Makey on 12.06.24.
//

import SwiftUI

struct CalculatorButton: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel
    
    let buttonType: ButtonType
    
    var body: some View {
        Button {
            viewModel.buttonDidTapped(buttonType)
        } label: {
            Text(buttonType.description)
                .font(.system(size: 36))
                .foregroundStyle(buttonType.foregroundColor)
                .frame(
                    width: buttonWidth(button: buttonType),
                    height: buttonHeight()
                )
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(buttonType.backgroundColor)
                }
        }
    }
    
    // Calculating Button Size Depending on the Screen Size
    private func buttonWidth(button: ButtonType) -> CGFloat {
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
