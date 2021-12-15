//
//  PaymentGateway.swift
//  Adapter
//
//  Created by Lia Kassardjian on 13/12/21.
//

import Foundation

/// Local interface example
protocol PaymentGateway {
    func receivePayment(amount: Double)
    var totalPayments: Double { get }
}

/// Local object conforming to interface
class PayPal: PaymentGateway {
    private var total: Double = 0.0
    
    func receivePayment(amount: Double) {
        total += amount
    }
    
    var totalPayments: Double {
        print("Total payments received via PayPal: \(total)")
        return total
    }
}

/// Local object conforming to interface
class Stripe: PaymentGateway {
    private var total: Double = 0.0
    
    func receivePayment(amount: Double) {
        total += amount
    }
    
    var totalPayments: Double {
        print("Total payments received via Venmo: \(total)")
        return total
    }
}
