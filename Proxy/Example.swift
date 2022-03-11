//
//  Example.swift
//  Proxy
//
//  Created by Lia Kassardjian on 10/03/22.
//

import Foundation

fileprivate class Example {
    func example() {
        print("Virtual proxy")
        virtualProxyExample()
        
        print("Remote proxy")
        remoteProxyExample()
        
        print("Protective proxy")
        protectiveProxyExample()
    }
    
    func virtualProxyExample() {
        guard let imageURL = URL(string: "https://developer.apple.com/swift/images/swift-og.png") else {
            fatalError("Could not create URL")
        }
        
        let imageProxy = ImageProxy(url: imageURL)
        print(imageProxy)
        
        for _ in 1...10 {
            let _ = imageProxy.image
        }
        print(imageProxy)
    }
    
    func remoteProxyExample() {
        guard let dataURL = URL(string: "https://developer.apple.com/swift/images/swift-og.png") else {
            fatalError("Could not create URL")
        }
        
        let dataProxy = RemoteDataProxy().data(url: dataURL) { (error, data) in
            guard error == nil else {
                print("Could not retrieve data from URL \(dataURL.absoluteString)")
                return
            }
            print("\(data?.count ?? 0) bytes retrieved from URL \(dataURL.absoluteString)")
        }
    
        dataProxy.run()
    }
    
    func protectiveProxyExample() {
        guard let imageURL = URL(string: "https://developer.apple.com/swift/images/swift-og.png") else {
            fatalError("Could not create URL")
        }
        
        let secureImageProxy = SecureImageProxy(url: imageURL)
        print(secureImageProxy)
        
        let _ = Authenticator.shared.authenticate(user: "Jim")
        if secureImageProxy.image != nil {
            print("Proxy has a valid image")
        }

        let _ = Authenticator.shared.authenticate(user: "John")
        if secureImageProxy.image != nil {
            print("Proxy has a valid image")
        }
    }
}
