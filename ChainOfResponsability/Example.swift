//
//  Example.swift
//  ChainOfResponsability
//
//  Created by Lia Kassardjian on 10/03/22.
//

import Foundation

fileprivate class Example {
    func example() {
        let dataHandler = Handler<Data>(next: nil)
        let stringHandler = Handler<String>(next: dataHandler)
        let dateHandler = Handler<Date>(next: stringHandler)
        
        let data = Data(repeating: 0, count: 10)
        dateHandler.handle(request: data)
        
        dateHandler.handle(request: 42)
    }
}
