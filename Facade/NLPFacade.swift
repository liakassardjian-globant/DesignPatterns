//
//  NLPFacade.swift
//  Facade
//
//  Created by Lia Kassardjian on 29/12/21.
//

import NaturalLanguage

class NLPFacade {
    private static let tagger = NLTagger(tagSchemes: [.lexicalClass])
    
    class func dominantLanguage(for string: String) -> String? {
        let language = NLLanguageRecognizer.dominantLanguage(for: string)
        return language?.rawValue
    }
    
    class func partsOfSpeech(for text: String) -> [WordLexicalClassPair] {
        var result = [WordLexicalClassPair]()
        
        tagger.string = text
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: [.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
            let wordLexicalClass = WordLexicalClassPair(word: String(text[range]), lexicalClass: tag?.rawValue ?? "unknown")
            result.append(wordLexicalClass)
            return true
        }
        
        return result
    }
}
