//
//  Actioneer.swift
//  Observer
//
//  Created by Lia Kassardjian on 11/03/22.
//

import Foundation

struct Auctioneer: Subject {
    private var bidders = [Bidder]()
    private var reservePrice: Float = 0
    private var currentBid: Float = 0
    private var auctionEnded: Bool = false
    
    var bid: Float {
        set {
            if auctionEnded {
                print("Auction ended, we can't accept new bids")
            } else if newValue > currentBid {
                print("New bid $\(newValue) accepted")
                if newValue > reservePrice {
                    print("Reserve price met. Auction ended")
                    auctionEnded = true
                }
                currentBid = newValue
                notifyObservers()
            }
        }
        get {
            return currentBid
        }
    }
    
    init(initialBid: Float = 0, reservePrice: Float) {
        self.bid = initialBid
        self.reservePrice = reservePrice
    }

    mutating func attach(observer: Bidder) {
        bidders.append(observer)
    }
    
    mutating func detach(observer: Bidder) {
        self.bidders = bidders.filter { $0.id != observer.id}
    }
    
    func notifyObservers() {
        let message = bid > reservePrice ? "Reserve met. Item sold" :  nil
        let notification = BidNotification(bid: bid, message: message)
        bidders.forEach { $0.update(notification: notification) }
    }
}
