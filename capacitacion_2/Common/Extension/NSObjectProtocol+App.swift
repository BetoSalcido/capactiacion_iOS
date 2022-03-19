//
//  NSObjectProtocolExtension.swift
//  Kelder
//
//  Created by Beto Salcido on 02/05/21.
//  Copyright © 2021 BetoSalcido. All rights reserved.
//

import Foundation

// This extension provides methods to help binding between view models and views
// in view controllers using KVO.
public extension NSObjectProtocol where Self: NSObject {
    /// Provides a way to observe a property and get notified when the property changes.
    /// - Parameters:
    ///     - keyPath: The KVO key path to observe.
    ///     - onChange: The callback gets triggered when the value of the observed key path changes.
    func observe<Value>(_ keyPath: KeyPath<Self, Value>,
                        onChange: @escaping (Value) -> ()) -> NSKeyValueObservation {
        return self.observe(keyPath, options: [.initial, .new]) { _, change in
            /*
             Swift 5.1 (iOS 13.3) and below language bug:
             change.newValue should never be `nil`, but when observing an optional property that's set to `nil`, then change.newValue is `nil` instead of `Optional(nil)`.
             
             Relevant bug reports:
             SR-6066, SR-5872
             
             Fix:
             Line 268 => https://github.com/apple/swift/pull/20757/files#diff-02aac31ac521a83bd42dae62c0f78115R268
             */
            let value = change.newValue ?? Optional<Any>.none as? Value

            guard let newValue = value else {
                return
            }
            
            onChange(newValue)
        }
    }
    
    /// Provides a way to bind a property to the provided target's property.
    /// - Parameters:
    ///     - sourceKeyPath: The KVO key path to observe.
    ///     - target: The target that needs the binding.
    ///     - targetKeyPath: The KVO key path from the target.
    func bind<Value, Target>(_ sourceKeyPath: KeyPath<Self, Value>,
                             to target: Target,
                             at targetKeyPath: ReferenceWritableKeyPath<Target, Value>) -> NSKeyValueObservation {
        return observe(sourceKeyPath) {
            target[keyPath: targetKeyPath] = $0
        }
    }
}
