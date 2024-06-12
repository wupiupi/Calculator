//
//  Digit.swift
//  Calculator
//
//  Created by Paul Makey on 12.06.24.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var description: String {
        "\(rawValue)"
    }
}
