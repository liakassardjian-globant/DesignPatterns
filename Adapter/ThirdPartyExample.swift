//
//  ThirdPartyExample.swift
//  Adapter
//
//  Created by Lia Kassardjian on 13/12/21.
//

import Foundation

/// Third-party class that doesn't conform to PaymentGateway
class AmazonPayments {
    var payments: Double = 0.0
    
    func paid(value: Double, currency: String) {
        payments += value
        print("Paid \(currency)\(value) via Amazon Payments")
    }
    
    func fulfilledTransactions() -> Double {
        return payments
    }
}
