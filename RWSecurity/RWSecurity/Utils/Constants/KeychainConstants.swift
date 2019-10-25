//
//  KeychainConstants.swift
//  RWSecurity
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 23/10/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

/// Name of service
internal let service: String = "MySecretService" // kRWKeychainUsers

/**
 Internal enum to return possible errors
 */
internal enum Errors: Error {
    /// Error creating keychain
    case keychainCreatingError
    /// Error adding data
    case keychainAddingError
    /// Error updating data
    case keychainUpdatingError
}
