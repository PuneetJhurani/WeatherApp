//
//  RepositoryInterfaces.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Vineet Rai on 12/07/23.
//

import Foundation

protocol WeatherRepositoryProtocol {
    
    func getEntity(pincode: String,
        completion: @escaping(Resource<ApiResponse>) -> Void
    )
}

