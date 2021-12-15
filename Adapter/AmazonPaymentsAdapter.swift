//
//  AmazonPaymentsAdapter.swift
//  Adapter
//
//  Created by Lia Kassardjian on 13/12/21.
//

import Foundation

/// Adapter for the third-party library.
/// Another option would be to extend ``AmazonPayments`` to conform to ``PaymentGateway``. In that case, this adapter type wouldn't be needed anymore.
class AmazonPaymentsAdapter: PaymentGateway {
    private let amazonPayments = AmazonPayments()
    
    func receivePayment(amount: Double) {
        amazonPayments.paid(value: amount, currency: "USD")
    }
    
    var totalPayments: Double {
        let total = amazonPayments.payments
        print("Total payments received via Amazon Payments: \(total)")
        return total
    }
}
