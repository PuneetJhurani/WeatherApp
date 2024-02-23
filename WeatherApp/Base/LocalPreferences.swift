//
//  localPreferences.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 04/07/23.
//

import Foundation

class LocalPreferences: LocalPreferencesProtocol {
    
    var preferences: UserDefaults
    static var instance: LocalPreferences?
    private  init() {
        print("local Prefernces Initialized ")
        self.preferences = UserDefaults.standard
    }
    
    static func getInstance() -> LocalPreferences{
        if let instance = self.instance {
            return instance
        }else {
            self.instance = LocalPreferences()
            return self.instance!
        }
        
    }
    
    func setBool(key: String, value: Bool) {
        self.preferences.set(value, forKey: key)
    }
    
    func getBool(key: String) -> Bool {
        if let _ = self.getObject(key: key) {
        }else {
            print("no value found for key \(key)")
        }
        return self.preferences.bool(forKey: key)
    }
    
    func setInt(key: String, value: Int) {
        self.preferences.set(value, forKey: key)
    }
    
    func getInt(key: String) -> Int {
        if let _ = self.getObject(key: key) {
        }else {
            print("no value found for key \(key)")
        }
        return self.preferences.integer(forKey: key)
    }
    
    
    func setDouble(key: String, value: Double) {
        self.preferences.set(value, forKey: key)
    }
    
    func getDouble(key: String) -> Double {
        if let _ = self.getObject(key: key) {
        }else {
            print("no value found for key \(key)")
        }
        return self.preferences.double(forKey: key)
    }
    
    func setString(key: String, value: String) {
        self.preferences.set(value, forKey: key)
    }
    
    func getString(key: String) -> String {
        if let _ = self.getObject(key: key) {
        }else {
            print("no value found for key \(key)")
        }
        return self.preferences.string(forKey: key)!
    }
    
    
    func setObject(key: String, data: Any) {
        self.preferences.set(data, forKey: key)
        
    }
    
    func getObject(key: String) -> Any? {
        let object = self.preferences.object(forKey: key)
        return object
    }
    
    func remove(key: String) {
        self.preferences.removeObject(forKey: key)
        
    }
}
