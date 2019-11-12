//
//  BiometricWrapper.swift
//  RWSecurity
//
//  Created by Cristian Olmedo on 11/11/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

import Foundation
import LocalAuthentication

public class BiometricWrapper {
    public static func requestBiometric(handler: @escaping (Bool, Error?) -> Void) throws {
        let context = LAContext()
        let LRea = "Biometric testing"
        var authError: NSError?
        if #available(iOS 8.0, *) {
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: LRea, reply: handler)
            } else {
                throw BiometricErrors.cantEvaluate
            }
        } else {
            throw BiometricErrors.notSupported
        }
    }
}
