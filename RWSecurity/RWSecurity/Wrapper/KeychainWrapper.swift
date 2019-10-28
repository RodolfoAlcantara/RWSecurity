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
    public static func set(value: Data, account: String) throws {
        if try KeychainOperations.exists(account: account) {
            // Mandar a llamar update
            try KeychainOperations.update(value: value, account: account)
        } else {
            // Simplemente agregar el dato
            try KeychainOperations.add(value: value, account: account)
        }
    }
    
    /**
     Funtion to retrieve an item in "Data" format (if not present, return nil)
     - parameters account: Account name for keychain item
     - Throws: Return error for to get data.
     */
    public static func get(account: String) throws -> Data? {
        if try KeychainOperations.exists(account: account){
            return try KeychainOperations.retreive(account: account)
        } else{
            throw Errors.keychainGetError
        }
    }

}
