//
//  Bidder.swift
//  Observer
//
//  Created by Lia Kassardjian on 11/03/22.
//

import Foundation

struct BidNotification {
    var bid: Float
    var message: String?
}

class Bidder: Observer {
    var id: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    func update(notification: BidNotification) {
        print("\(self.id) new bid is: \(notification.bid) \(notification.message ?? "")")
    }
}
