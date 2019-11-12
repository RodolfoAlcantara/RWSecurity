//
//  KeychainWrapper.swift
//  RWSecurity
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 23/10/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

/**
 
 */
public class KeychainWrapper: NSObject {
    /**
     */
    public static func set(value: Data, account: String, key: String) throws {
        if try KeychainOperations.exists(account: account) {
            // Mandar a llamar update
            try KeychainOperations.update(value: Cryptor.encrypt(key: key, dataToEncrypt: value), account: account)
        } else {
            // Simplemente agregar el dato
            try KeychainOperations.add(value: Cryptor.encrypt(key: key, dataToEncrypt: value), account: account)
        }
    }
    /**
     Function to retrieve an item in "Data" format (if not present, return nil)
     - parameters account: Account name for keychain item
     - Throws: Return error for to get data.
     */
    public static func get(account: String, key: String) throws -> Data? {
        if try KeychainOperations.exists(account: account) {
            if let rescuedData = try KeychainOperations.retreive(account: account) {
                return try Cryptor.decrypt(key: key, dataToDecrypt: rescuedData)
            }
            throw Errors.keychainGetError
        } else {
            throw Errors.keychainGetError
        }
    }
    /**
     Deletes an account
     - parameter account: Account to delete
     - throws Error at deleting items
     */
    public static func delete(account: String) throws {
        if try KeychainOperations.exists(account: account) {
            //Call delete
            try KeychainOperations.delete(account: account)
        } else {
            /// MARK Finish this function with error handling
            throw Errors.keychainDeletingError
        }
    }
    public static func deleteAll() throws {
        try KeychainOperations.deleteAll()
    }
}
