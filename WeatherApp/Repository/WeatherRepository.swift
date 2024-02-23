//
//  any_repository.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet on 12/07/23.
//  To be changed to Async await in future versions

import Foundation

class WeatherRepository: BaseRepository, WeatherRepositoryProtocol {
    
    var apiManager: NetworkProtocol?
    
    init(apiManager: NetworkProtocol?) {
        self.apiManager = apiManager
    }
    //  To be changed to Async await in future versions
    func getEntity(pincode : String, completion: @escaping(Resource<ApiResponse>) -> Void) {
        
        self.apiManager?.getAnyEntity(pincode : pincode ,
            completion:  { [weak self] anyEntity, error in
                self?.handleApiCall(
                    response: anyEntity,
                    error: error,
                    completion: completion
                )
            }
        )
    }
}
