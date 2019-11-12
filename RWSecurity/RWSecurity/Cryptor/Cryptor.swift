//
//  Cryptor.swift
//  RWSecurity
//
//  Created by Cristian Olmedo on 11/11/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

import Foundation
import RNCryptor

/**
    Wraps crypting functions for encrypt and decrypt
 */
public class Cryptor {
    /**
    Encryptes from given data
    - parameter key: This is the cypher key
    - parameter dataToEncrypt: Data that is about to be crypted
     */
    public static func encrypt(key: String, dataToEncrypt: Data) -> Data {
        print("Crypting 🔐...")
        return RNCryptor.encrypt(data: dataToEncrypt, withPassword: key)
    }
    /**
    Decryptes from given data
    - parameter key: This is the cypher key
    - parameter dataToEncrypt: Data that is about to be crypted
    - throws: error at decrypting
     */
    public static func decrypt(key: String, dataToDecrypt: Data) throws -> Data {
        print("Decrypting 🔓...")
        return try RNCryptor.decrypt(data: dataToDecrypt, withPassword: key)
    }
}
