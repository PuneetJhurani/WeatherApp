//
//  appModule.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 05/07/23.
//

import Foundation
import Swinject


class AppModule: Assembly {
    
    func assemble(container: Container) {
        container.register(
            LocalPreferencesProtocol.self
        ) { res in
            return LocalPreferences.getInstance()
        }
        
        container.register(EncryptionHelper.self) { res in
            return EncryptionHelper.getInstance()
        }
        
        container.register(AnalyticsHelper.self) { res in
            return AnalyticsHelper.getInstance()
        }
        
        container.register(AppSettings.self) { res in
            return AppSettings.getInstance(
                prefs: res.resolve(
                    LocalPreferencesProtocol.self
                )!,
                encrypt: res.resolve(
                    EncryptionHelper.self
                )!
            )
        }
 
        container.register(NetworkProtocol.self) { res in
            return ApiManager.getInstance(
                session: nil,
                preferences: res.resolve(AppSettings.self)
            )
        }
    }
}


class RepoModule: Assembly {
    func assemble(container: Container) {
        container.register(WeatherRepositoryProtocol.self) {
            res in
            if let apiManager = res.resolve(NetworkProtocol.self) as? ApiManager  {
                return WeatherRepository(apiManager: apiManager)
            } else {
                print("Api manager not resolved")
                return WeatherRepository(apiManager: nil)
            }
        }
    }
}

let assembler = Assembler([AppModule(), RepoModule()])

