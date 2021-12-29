//
//  WordLexicalClassPair.swift
//  Facade
//
//  Created by Lia Kassardjian on 29/12/21.
//

struct WordLexicalClassPair {
    let word: String
    let lexicalClass: String
}

extension WordLexicalClassPair: CustomStringConvertible {
    var description: String {
        return "\"\(word)\": \(lexicalClass)"
    }
}
