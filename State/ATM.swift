//
//  ATM.swift
//  State
//
//  Created by Lia Kassardjian on 11/03/22.
//

import Foundation

final class ATM {
    var state: ATMState = IdleState()
    
    public func enter(pin: String) {
        state = EnterPINState(context: self)
        state.validate(pin: pin)
    }
    
    public func withdraw(amount: Float) -> Bool {
        var stateCopy = state
        return stateCopy.withdraw(amount: amount)
    }
}
