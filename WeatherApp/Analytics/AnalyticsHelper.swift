//
//  AnalyticsHelper.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Vineet Rai on 20/07/23.
//

import Foundation
import UIKit

class AnalyticsHelper  {
    // MARK: - Variables
    let kSystemVersion = UIDevice.current.systemVersion
    let kdeviceModelName = UIDevice.current.model
    typealias APIParams = [String: AnyObject]
    private static var instance: AnalyticsHelper? = AnalyticsHelper()
    
    private init() {
        print("inside init")
    }
    
    static func getInstance() -> AnalyticsHelper {
        if let instance = self.instance {
            return instance
        }else {
            return AnalyticsHelper()
        }
    }
    // MARK: - Public function

    func logEventswithParams(
        _ eventName: String ,
        _ params: APIParams
    ) {
        var eventParams = params
        // platform params
        eventParams[FirebaseEventParams.platform] = "iOS"  as AnyObject
        eventParams[FirebaseEventParams.osversion] =  kSystemVersion as AnyObject
        eventParams[FirebaseEventParams.devicemodel] = kdeviceModelName as AnyObject
//        if .isLoggedIn() {
//            eventParams = self.getUserParams(eventParams)
//        }
        print("event logged ----->> name = \(eventName) \n eventParams = \(eventParams) ")
    }

    func getUserParams(_ apiparams: APIParams) -> APIParams {
        var eventParams = apiparams
        eventParams[FirebaseEventParams.email] = "abc@gmail.com" as AnyObject
        return eventParams
    }
}
