//
//  EncryptionHelper.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 06/07/23.
//

import Foundation

class EncryptionHelper {
    
    private static var instance: EncryptionHelper? = EncryptionHelper()
    
    private init() {
        print("Encryption Helper initialized")
    }
    
    static func getInstance() -> EncryptionHelper {
        if let instance = self.instance {
            return instance
        }else {
            return EncryptionHelper()
        }
    }
    
    func  encrypt(text: String) {
        print("inside encryption")
    }
    
    func  decrypt(text: String) {
        print("inside decryption")
    }
}
