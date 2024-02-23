//
//  local_preferences.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 06/07/23.
//

import Foundation


class AppSettings {
    
    static let isLoggedInKey = "isLoggedInKey"
    static let authCodeKey = "authCodeKey"
    static let articleInfoKey = "articleInfoKey"
    var preferences: LocalPreferencesProtocol?
    var encryptionHelper: EncryptionHelper?
    private static var instance: AppSettings?
    
    private init(
        prefs: LocalPreferencesProtocol?,
        encrypt: EncryptionHelper?
    ) {
        self.preferences = prefs ?? LocalPreferences.getInstance()
        self.encryptionHelper = encrypt ?? EncryptionHelper.getInstance()
    }
    
    static func getInstance(
        prefs: LocalPreferencesProtocol,
        encrypt: EncryptionHelper) -> AppSettings {
            
            if let instance = self.instance {
                return instance
            } else {
                self.instance = AppSettings(prefs: prefs, encrypt: encrypt)
                return self.instance!
            }
        }
    
    // Example Preferences
    func setIsLoggedIn(isLoggedIn: Bool) {
        self.preferences?.setBool(
            key: AppSettings.isLoggedInKey,
            value: isLoggedIn
        )
    }
    
    func getIsLoggedIn(defaultValue: Bool) -> Bool {
        return self.preferences?.getBool(
            key: AppSettings.isLoggedInKey) ?? defaultValue
    }
    
    func saveInfo(article: WeatherDetail?) -> Bool {
        if let article = article {
            do {
                
                try  self.preferences?.setObject(
                    key: AppSettings.articleInfoKey,
                    data: JSONEncoder().encode(article)
                )
                return true
            } catch {
                return false
            }
        } else {
            return false
        }
    }
    
}
