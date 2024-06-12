//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Paul Makey on 10.06.24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @StateObject private var calculatorViewVM = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(calculatorViewVM)
        }
    }
}
