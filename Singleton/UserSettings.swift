//
//  UserSettings.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 10/08/21.
//

import Foundation

/// ``UserSettings`` class is a thread-safe Singleton.
final public class UserSettings {
    
    /// A dictionary storing all user settings, with a String key and a String or Int value.
    private var settings: [String: Any] = [
        "Theme": "Vivid",
        "Brightness": 50
    ]
    
    /// This queue is used to prevent concurrent access to the settings.
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private init() {}
    
    /// The only instance of ``UserSettings`` in the application.
    public static let shared = UserSettings()
    
    /**
     Gets a String from the user settings using the provided key.
     - Parameter key: A String containing the key.
     - Returns: A String containing the value.
     
     This method uses the ``concurrentQueue`` to update the ``settings`` variable concurrently.
     */
    public func string(forKey key: String) -> String? {
        var result: String?
        concurrentQueue.sync {
            result = settings[key] as? String
        }
        return result
    }
    
    /**
     Gets an Int from the user settings using the provided key.
     - Parameter key: A String containing the key.
     - Returns: An Int containing the value.
     
     This method uses the ``concurrentQueue`` to update the ``settings`` variable concurrently.
     */
    public func int(forKey key: String) -> Int? {
        var result: Int?
        concurrentQueue.sync {
            result = settings[key] as? Int
        }
        return result
    }
    
    /**
     Sets a new value for the provided key.
     - Parameters:
        - value: An Int or a String containing the value.
        - key: A String containing the key.
     
     This method uses the ``concurrentQueue`` as a barrier to avoid concurrent access.
     */
    public func set(value: Any, forKey key: String) {
        concurrentQueue.async(flags: .barrier) {
            self.settings[key] = value
        }
    }
}
