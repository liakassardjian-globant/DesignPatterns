//
//  Example.swift
//  Adapter
//
//  Created by Lia Kassardjian on 13/12/21.
//

import Foundation

fileprivate class Example {
    private func run() {
        /// ``PayPal`` and ``Stripe`` both conform to ``PaymentGateway``, which is the known interface.
        /// It's easy to work with objects when the interface is the same for all of them.
        ///
        let paypal = PayPal()
        paypal.receivePayment(amount: 100)
        paypal.receivePayment(amount: 200)
        paypal.receivePayment(amount: 300)

        let stripe = Stripe()
        stripe.receivePayment(amount: 100)
        stripe.receivePayment(amount: 200)
        stripe.receivePayment(amount: 300)
        
        var paymentGateways: [PaymentGateway] = [paypal, stripe]
        
        /// Considering ``AmazonPayments`` as a third-party library, it doesn't conform to the previously used interface,
        /// so it can't be used along with PayPal or Stripe

        let amazonPayments = AmazonPayments()
        amazonPayments.paid(value: 100, currency: "USD")
        amazonPayments.paid(value: 200, currency: "USD")
        
        /// This line won't compile
        /// `paymentGateways.append(contentsOf: amazonPayments)`
        
        /// We can use an ``AmazonPaymentsAdapter`` instance instead of using the ``AmazonPayments`` type directly.
        /// The caller won't even know that we're using a third-party library, thanks to the Adapter.
        
        let amazonPaymentsAdapter = AmazonPaymentsAdapter()
        amazonPaymentsAdapter.receivePayment(amount: 100)
        amazonPaymentsAdapter.receivePayment(amount: 200)
        amazonPaymentsAdapter.receivePayment(amount: 300)
        
        paymentGateways.append(amazonPaymentsAdapter)
        
        var total: Double = 0.0
        for gateway in paymentGateways {
            total += gateway.totalPayments
        }
        
        print(total)
    }
}
