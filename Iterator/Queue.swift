//
//  Queue.swift
//  Iterator
//
//  Created by Lia Kassardjian on 10/03/22.
//

import Foundation

final class Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func enqueue(_ value: T) {
        let newNode = Node<T>(value)
        
        guard head != nil else {
            head = newNode
            tail = head
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    func dequeue() -> T? {
        guard let headItem = head?.key else {
            return nil
        }
        
        if let nextNode = head?.next {
            head = nextNode
        } else {
            head = nil
            tail = nil
        }
        
        return headItem
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peak() -> T? {
        return head?.key
    }
}

extension Queue: Sequence {
    func makeIterator() -> QueueIterator<T> {
        return QueueIterator(self)
    }
}
