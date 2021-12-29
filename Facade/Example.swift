//
//  Example.swift
//  Facade
//
//  Created by Lia Kassardjian on 29/12/21.
//

import Foundation

fileprivate class Example {
    func example() {
        let text = "The Façade is simple yet useful"
        print(text)
        
        let language = NLPFacade.dominantLanguage(for: text) ?? "unknown"
        print(language)
        
        let result = NLPFacade.partsOfSpeech(for: text)
        print(result)
    }
}
