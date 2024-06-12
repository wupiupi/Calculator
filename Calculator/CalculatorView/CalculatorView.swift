//
//  CalculatorView.swift
//  Calculator
//
//  Created by Paul Makey on 10.06.24.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: CalculatorView.ViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                DisplayedText()
                
                AnswerText()
                
                Spacer()
                
                Divider()
                
                CalculatorButtons()
                    .padding(.bottom, 3)
            }
        }
    }
    
    @ViewBuilder
    func DisplayedText() -> some View {
        Text(viewModel.displayText)
            .modifier(TextModifier())
            .foregroundColor(.white)
        
    }
    
    @ViewBuilder
    func AnswerText() -> some View {
        Text(viewModel.displayResult)
            .modifier(TextModifier())
            .foregroundColor(Color(hex: 0x969696))
    }
    
    @ViewBuilder
    func CalculatorButtons() -> some View {
        ForEach(viewModel.calculatorButtons, id: \.self) { row in
            HStack(spacing: 12) {
                ForEach(row, id: \.self) { button in
                    CalculatorButton(buttonType: button)
                }
            }
        }
    }
    
    struct TextModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 48, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
        }
    }
}

#Preview {
    CalculatorView()
}
