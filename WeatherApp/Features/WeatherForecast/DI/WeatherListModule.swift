//
//  TodoListModule.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 28/07/23.
//

import Foundation
import Swinject

class WeatherListModule: Assembly {
    func assemble(container: Container) {
        container.register(WeatherViewModel.self) { r  in
            let repoInstance = assembler.resolver.resolve(WeatherRepositoryProtocol.self)
            let analyticsHelper = assembler.resolver.resolve(AnalyticsHelper.self)
            return WeatherViewModel(
                repository: repoInstance,
                analyticsHelper: analyticsHelper
            )
        }
    }
}

let articleListModule = Assembler([WeatherListModule()])
