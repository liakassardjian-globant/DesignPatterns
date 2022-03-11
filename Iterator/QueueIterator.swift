//
//  QueueIterator.swift
//  Iterator
//
//  Created by Lia Kassardjian on 10/03/22.
//

import Foundation

struct QueueIterator<T>: IteratorProtocol {
    private let queue: Queue<T>
    private var currentNode: Node<T>?
    
    init(_ queue: Queue<T>) {
        self.queue = queue
        self.currentNode = queue.head
    }
    
    mutating func next() -> T? {
        guard let node = currentNode else {
            return nil
        }
        
        let nextKey = node.key
        currentNode = node.next
        return nextKey
    }
}
