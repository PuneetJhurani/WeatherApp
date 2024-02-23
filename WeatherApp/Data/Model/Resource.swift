//
//  Resource.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 10/07/23.
//

import Foundation


class Resource<T> {
    var status: Status?
    var data: T?
    var message: String?
    var errorCode: Int?
    
    init(status: Status, data: T?, message: String?, errorCode: Int?) {
        self.status = status
        self.data = data
        self.errorCode = errorCode
        self.message = message
    }
    
    convenience init(successData: T) {
        self.init(
            status: .success,
            data: successData,
            message: "Success",
            errorCode: nil
        )
    }
    
    convenience init(failureData: T?, errorCode: Int?, message: String?) {
        self.init(
            status: .error,
            data: failureData,
            message: message,
            errorCode: errorCode
        )
    }
    
}
