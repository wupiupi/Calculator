//
//  Extension + Color.swift
//  Calculator
//
//  Created by Paul Makey on 10.06.24.
//

import SwiftUI

/// - This Extension Allow to Use Color HEX Components as init for Color Type
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
