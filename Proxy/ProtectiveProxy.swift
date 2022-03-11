//
//  ProtectiveProxy.swift
//  Proxy
//
//  Created by Lia Kassardjian on 10/03/22.
//

import UIKit

public protocol Authenticating {
    var isAuthenticated: Bool { get }
    func authenticate(user: String) -> Bool
}

public class Authenticator: Authenticating {
    static public let shared = Authenticator()

    public var isAuthenticated: Bool = false
    fileprivate let userWhiteList = ["John", "Mary", "Steve"]
    fileprivate let syncQueue = DispatchQueue(label: "com.liakass.authQueue")
    
    private init() {}
    
    public func authenticate(user: String) -> Bool {
        var result = false
        syncQueue.sync {
            result = userWhiteList.contains(user) ? true : false
            
            if result == false {
                print("Error: unauthorized!")
                isAuthenticated = false
            } else {
                print("Anauthorized!")
                isAuthenticated = true
            }
        }
        
        return result
    }
}

public class SecureImageProxy: RemoteImage {
    public let url: URL
    public var hasContent: Bool = false
    
    fileprivate lazy var imageProxy: ImageProxy = ImageProxy(url: self.url)
    
    public required init(url: URL) {
        self.url = url
    }
    
    public var image: UIImage? {
        get {
            return Authenticator.shared.isAuthenticated ? self.imageProxy.image : nil
        }
    }
}
