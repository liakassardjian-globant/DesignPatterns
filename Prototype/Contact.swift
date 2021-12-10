//
//  Contact.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 10/08/21.
//

import Foundation

class Contact: NSCopying {
    var firstName: String
    var lastName: String
    var address: Address
    
    init(firstName: String, lastName: String, address: Address) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Contact(firstName: self.firstName, lastName: self.lastName, address: (self.address.copy() as! Address))
    }
    
    func clone() -> Contact {
        return self.copy() as! Contact
    }
}

extension Contact: CustomStringConvertible {
    var description: String {
        return "Contact(firstName: \"\(firstName)\", lastName: \"\(lastName)\", address: \"\(address)\")"
    }
}

var john = Contact(
    firstName: "John",
    lastName: "Appleseed",
    address: Address(street: "1, Infinite Lopp", city: "Cupertino", zip: "95014")
)

var bob = john.clone()
