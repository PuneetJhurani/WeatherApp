//
//  NetworkProtocol.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 05/07/23.
//

import Foundation


protocol NetworkProtocol {
    func getAnyEntity(pincode: String ,
        completion: @escaping (ApiResponse?,ResponseException?) -> Void
    )
    
}
