//
//  Observer+SubjectProtocol.swift
//  Observer
//
//  Created by Lia Kassardjian on 11/03/22.
//

import Foundation

protocol Observer {
    associatedtype Notification
    func update(notification: Notification)
}

protocol Subject {
    associatedtype O: Observer
    mutating func attach(observer: O)
    mutating func detach(observer: O)
    
    func notifyObservers()
}
