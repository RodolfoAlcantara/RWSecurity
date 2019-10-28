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
        }
    }

}
