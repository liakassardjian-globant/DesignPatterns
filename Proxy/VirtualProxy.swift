//
//  VirtualProxy.swift
//  Proxy
//
//  Created by Lia Kassardjian on 10/03/22.
//

import UIKit

public protocol RemoteImage: CustomStringConvertible {
    init(url: URL)
    var image: UIImage? { get }
    var url: URL { get }
    var hasContent: Bool { get }
    var description: String { get }
}

extension RemoteImage {
    public var description: String {
        let description = hasContent ? "Image available. Retrieved from \(self.url.absoluteString)"
                                     : "No image available yet!"
        
        return description
        
    }
}

public class ImageProxy: RemoteImage {
    public let url: URL
    public var hasContent: Bool = false
    private var counter = 0
    
    public required init(url: URL) {
        self.url = url
    }
    
    public lazy var image: UIImage? = { [unowned self] in
        self.counter += 1
        print("Image property accessed \(counter) time(s)")
        
        var result: UIImage?
        if let image = try? UIImage(data: Data(contentsOf: self.url)) {
            result = image
            self.hasContent = true
        }
        return result
    }()
}
