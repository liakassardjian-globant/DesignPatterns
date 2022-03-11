//
//  ATMState.swift
//  State
//
//  Created by Lia Kassardjian on 11/03/22.
//

import Foundation

protocol ATMState {
    func validate(pin: String)
    mutating func withdraw(amount: Float) -> Bool
    func transactionCompleted(success: Bool)
}

extension ATMState {
    func validate(pin: String) {}
    
    mutating func withdraw(amount: Float) -> Bool { return false }
    
    func transactionCompleted(success: Bool) {}
}

struct IdleState: ATMState {}

struct EnterPINState: ATMState {
    var context: ATM
    
    func validate(pin: String) {
        guard pin == "1234" else {
            context.state = TransactionCompleteState(context: context)
            context.state.transactionCompleted(success: false)
            return
        }
        
        context.state = WithdrawState(context: context)
    }
}

struct TransactionCompleteState: ATMState {
    var context: ATM
    
    func transactionCompleted(success: Bool) {
        print(success ? "Transaction completed!" : "Transaction failed!")
        context.state = IdleState()
    }
}

struct WithdrawState: ATMState {
    var context: ATM
    var availableFunds: Float = 1000
    
    init(context: ATM) {
        self.context = context
    }
    
    mutating func withdraw(amount: Float) -> Bool {
        print("Withdraw $\(amount)")
        
        guard amount > 0 else {
            print("Error. Invalid amount.")
            context.state = TransactionCompleteState(context: context)
            context.state.transactionCompleted(success: false)
            return false
        }
        
        guard availableFunds >= amount else {
            print("Error. Insufficient funds.")
            context.state = TransactionCompleteState(context: context)
            context.state.transactionCompleted(success: false)
            return false
        }
        
        availableFunds -= amount
        context.state = TransactionCompleteState(context: context)
        context.state.transactionCompleted(success: true)
        
        return true
    }
}
