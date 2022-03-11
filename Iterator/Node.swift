//
//  Node.swift
//  Iterator
//
//  Created by Lia Kassardjian on 10/03/22.
//

import Foundation

final class Node<T> {
    var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        key = value
    }
}
