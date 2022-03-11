//
//  Example.swift
//  Observer
//
//  Created by Lia Kassardjian on 11/03/22.
//

import Foundation

fileprivate class Example {
    func example() {
        var auctioneer = Auctioneer(reservePrice: 500)
        
        let abby = Bidder()
        let julia = Bidder()
        let joe = Bidder()
        let hans = Bidder()
        
        auctioneer.attach(observer: abby)
        auctioneer.attach(observer: julia)
        auctioneer.attach(observer: joe)
        auctioneer.attach(observer: hans)
        
        auctioneer.bid = 100
        auctioneer.bid = 150
        auctioneer.bid = 300
        auctioneer.bid = 550
    }
}
