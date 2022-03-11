//
//  RemoteProxy.swift
//  Proxy
//
//  Created by Lia Kassardjian on 10/03/22.
//

public protocol RemoteData {
    func data(url: URL, completionHandler: @escaping(Error?, Data?) -> Void) -> RemoteData
    func run()
}

public class RemoteDataProxy: RemoteData {
    fileprivate var callback: ((Error?, Data?) -> Void)?
    fileprivate var url: URL?
    
    public init() {}
    
    public func data(url: URL, completionHandler: @escaping (Error?, Data?) -> Void) -> RemoteData {
        self.url = url
        self.callback = completionHandler
        return self
    }
    
    public func run() {
        if let callback = callback, let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    print("Could not download data from URL \(url.absoluteString). Reason: \(error!.localizedDescription)")
                    callback(error, nil)
                    return
                }

                print("Data successfully fetched from URL \(url.absoluteString)")
                callback(nil, data)
            }.resume()
            
            print("Downloading data from URL \(url.absoluteString)")
        } else {
            print("run() called before invoking data(url:completionHandler:)")
        }
    }
}
