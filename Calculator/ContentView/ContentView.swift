//
//  ContentView.swift
//  Calculator
//
//  Created by Paul Makey on 10.06.24.
//

import SwiftUI

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
