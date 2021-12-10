//
//  Address.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 10/08/21.
//

import Foundation

class Address: NSCopying {
    var street: String
    var city: String
    var zip: String
    
    init(street: String, city: String, zip: String) {
        self.street = street
        self.city = city
        self.zip = zip
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Address(street: self.street, city: self.city, zip: self.zip)
    }
}

extension Address: CustomStringConvertible {
    var description: String {
        return "Address(street: \"\(street)\", city: \"\(city)\", zip: \"\(zip)\")"
    }
}
