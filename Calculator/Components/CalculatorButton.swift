//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Paul Makey on 12.06.24.
//

import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        @EnvironmentObject private var viewModel: CalculatorView.ViewModel
        
        let buttonType: ButtonType
        
        var body: some View {
            Button {
                viewModel.buttonDidTapped(buttonType)
            } label: {
                Text(buttonType.description)
                    .font(.system(size: 36))
                    .foregroundStyle(buttonType.foregroundColor)
                    .frame(
                        width: getButtonSize(buttonType),
                        height: buttonHeight()
                    )
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(buttonType.backgroundColor)
                    }
            }
        }
        
        // Calculating Button Size Depending on the Screen Size
        private func getButtonSize(_ button: ButtonType) -> CGFloat {
            /// buttonSize = (screenWidth - (spacingCount * padding)) / buttonCount
            if button == .equal {
                return ((UIScreen.main.bounds.width - (3 * 12)) / 4) * 2
            }
            return (UIScreen.main.bounds.width - (5 * 12)) / 4
        }
        
        private func buttonHeight() -> CGFloat {
            return (UIScreen.main.bounds.width - (5 * 12)) / 4
        }
    }
}
