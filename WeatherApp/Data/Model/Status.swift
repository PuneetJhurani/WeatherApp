//
//  Status.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 05/07/23.
//

import Foundation


enum Status {
    case success
    case error
}

enum StatusInternal: Int {
    case ok = 200
    case notFound = 404
}
