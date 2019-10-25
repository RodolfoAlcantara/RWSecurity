//
//  KeychainOperations.swift
//  RWSecurity
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 23/10/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

/**
 
 */
internal class KeychainOperations: NSObject {
    /**
     This function evalute if exist keychain data
     - parameter account: idValue
     - returns: Value to know if this data is correct
     - throws: Error to create keychain
     */
    internal static func exists(account: String) throws -> Bool {
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecReturnData: false
        ] as NSDictionary, nil)

        switch status {
        case errSecSuccess:
            return true
        case errSecItemNotFound:
            return false
        default:
            throw Errors.keychainCreatingError
        }
    }
    /**
     Add a value the keychain
     - parameter value: valueSave
     - parameter account: idValue
     - throws: Error to save keychain
    */
    internal static func add(value: Data, account: String) throws {
        let status = SecItemAdd([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock,
            kSecValueData: value
        ] as NSDictionary, nil)
        guard status == errSecSuccess else { throw Errors.keychainAddingError }
    }
    /**
    
    */
    internal static func update(value: Data, account: String) throws {
        let status = SecItemUpdate([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service
        ] as NSDictionary, [
            kSecValueData: value
        ] as NSDictionary)
        guard status == errSecSuccess else { throw Errors.keychainUpdatingError }
    }
}
