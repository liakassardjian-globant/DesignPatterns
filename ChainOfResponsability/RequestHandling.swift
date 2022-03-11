//
//  RequestHandling.swift
//  ChainOfResponsability
//
//  Created by Lia Kassardjian on 10/03/22.
//

import Foundation

protocol RequestHandling {
    init(next: RequestHandling?)
    func handle(request: Any)
}

final class Handler<T>: RequestHandling {
    private var nextHandler: RequestHandling?
    
    init(next: RequestHandling?) {
        self.nextHandler = next
    }
    
    func handle(request: Any) {
        if request is T {
            print("Request processed by \(self)")
        } else {
            guard let nextHandler = nextHandler else {
                print("Reached end of the responder chain")
                return
            }

            print("\(self) can't handle \(type(of: request)) requests - forwarding to \(nextHandler)")
            nextHandler.handle(request: request)
        }
    }
}

extension Handler: CustomStringConvertible {
    var description: String {
        return "\(T.self) Handler"
    }
}
