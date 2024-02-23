//
//  TodoListViewModel.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 24/07/23.
//

import Foundation
import SwiftUI


class WeatherViewModel: ObservableObject{
    
    @Published var weeklyWeatherForecast = [WeatherDetail]()
    @Published var isLoading  = false
    @Published var errorMessage = ""
    @Published var cityName = ""
    private var repo: WeatherRepositoryProtocol?
    
    private var analyticsHelper: AnalyticsHelper?
    init(
        repository: WeatherRepositoryProtocol?,
        analyticsHelper: AnalyticsHelper?
    ) {
        self.repo = repository
        self.analyticsHelper = analyticsHelper
    }
    
    func fetchWeatherForeCast(pincode : String) {
        
        if pincode.isEmpty {
            self.isLoading = false
            self.errorMessage = "Empty pincode"
            return
        }
        
        self.isLoading = true
        self.weeklyWeatherForecast = []
        self.repo?.getEntity(pincode : pincode , completion: {[weak self] resource in
            print(resource)
            DispatchQueue.main.async {
                
                if resource.status == .success {
                    self?.weeklyWeatherForecast = resource.data?.list ?? []
                    self?.cityName = resource.data?.city?.name ?? ""
                    self?.isLoading = false
                }else {
                    self?.isLoading = false
                    self?.errorMessage = resource.message ?? ""
                    
                }
            }
        })
    }
    
    func separateDateAndTime(from dateString: String) -> (date: String, time: String, isAm :Bool)? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Adjust the date format according to your string
        
        if let date = dateFormatter.date(from: dateString) {
            // Format date
            let dateOnlyFormatter = DateFormatter()
            dateOnlyFormatter.dateFormat = "yyyy-MM-dd" // Adjust the date format as needed
            let datePart = dateOnlyFormatter.string(from: date)
            
            // Format time
            let timeOnlyFormatter = DateFormatter()
            timeOnlyFormatter.dateFormat = "HH:mm"
            var isAm = false
            if timeOnlyFormatter.calendar.component(.hour, from: date ) >= 12 {
                isAm = false
            }else {
                isAm = true
            }
            timeOnlyFormatter.dateFormat = "hh:mm"
            var timePart = timeOnlyFormatter.string(from: date)
            timePart = timePart.trimmingCharacters(in: .whitespaces)
            return (datePart, timePart, isAm)
        } else {
            print("Failed to parse date")
            return nil
        }
    }
    
    
    
}



