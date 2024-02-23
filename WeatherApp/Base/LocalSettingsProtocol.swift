//
//  local_prefernces.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 04/07/23.
//

import Foundation

protocol LocalPreferencesProtocol {
    
    func setBool(key: String, value: Bool)
    
    func getBool(key: String) -> Bool
    
    func setInt(key: String, value: Int)
    
    func getInt(key: String) -> Int
    
    func setDouble(key:String, value: Double)
    
    func getDouble(key: String) -> Double
    
    func setString(key: String, value: String)
    
    func getString(key: String) -> String
    
    func setObject(key: String, data : Any)
    
    func getObject(key: String) ->Any?
    
    func remove(key: String)
    
}

