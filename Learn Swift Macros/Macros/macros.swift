//
//  file.swift
//  Learn Swift Macros
//
//  Created by Zakarai Lachkar on 2/11/2023.
//

import Foundation

/// Freestanding macros appear on their own, without being attached to a declaration.
/// Freestanding macro it's an existing macro in swift like #warning and #Preview
/// we can't test with : #error("ici y'un erreur") , So we should use :
/// guard !isError else {
///fatalError("ici y'un erreur")
///}
public func FreestandingMacro(isError: Bool) {
    let currentFileName = #file
    print("Currently running \(#function)")
    print("File Name: \(currentFileName)")
    #warning("Something's wrong")
    guard !isError else {
        fatalError("ici y'un erreur")
    }
}
/// Attached macros modify the declaration that they’re attached to a declaration.


struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }


    typealias RawValue = Int
    var rawValue: RawValue
    init() { self.rawValue = 0 }
    init(rawValue: RawValue) { self.rawValue = rawValue }
    static let nuts: Self = Self(rawValue: 1 << Options.nuts.rawValue)
    static let cherry: Self = Self(rawValue: 1 << Options.cherry.rawValue)
    static let fudge: Self = Self(rawValue: 1 << Options.fudge.rawValue)
}
extension SundaeToppings: OptionSet { }

@attached(member)
public macro OptionSetMember<RawType>() =
        #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")

@freestanding(expression)
public macro line<T: ExpressibleByIntegerLiteral>() -> T =
        #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")

