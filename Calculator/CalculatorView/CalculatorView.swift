//
//  CalculatorView.swift
//  Calculator
//
//  Created by Paul Makey on 10.06.24.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                DisplayedText()
                
                Spacer()
                
                Divider()
                
                CalculatorButtons()
                    .padding(.bottom, 3)
            }
        }
    }
    
    @ViewBuilder
    func DisplayedText() -> some View {
        HStack(spacing: 20) {
            Spacer()
            
            Text(viewModel.displayedText)
                .padding(.top, 20)
                .padding(.trailing, 16)
                .font(.system(size: 48))
                .foregroundStyle(.white)
        }
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
}

#Preview {
    CalculatorView()
}
