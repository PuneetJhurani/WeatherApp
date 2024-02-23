//
//  TodoListView.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 28/07/23.
//

import SwiftUI
import Combine

struct WeatherForecastView: View {
    
    @ObservedObject private var viewModel = (articleListModule.resolver.resolve(WeatherViewModel.self))!
    @State var pinCode = ""
    var body: some View {
        
        GeometryReader { proxy in
            VStack(alignment: .center) {
                Text("Welcome to Weather Department")
                    .font(.headline)
                HStack(alignment: .top){
                    Text("Pincode : ")
                        .font(.headline)
                        .padding(.top, 5)
                    TextField("Pincode", text: $pinCode)
                        .padding(.all,0)
                        .frame(width : 160.0, height: 30.0)
                        .border(.black)
                        .keyboardType(.numberPad)
                        .onReceive(Just(pinCode)) { pincode in
                            if pinCode.count > 6 {
                                pinCode = String(pincode.prefix(6))
                            }
                        }
                    Button {
                        self.viewModel.fetchWeatherForeCast(pincode: pinCode)
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }.padding(.top , 5.0)

                }.frame(width: proxy.size.width,height: 40.0)
                Text(viewModel.cityName)
                    .font(.headline)
                NavigationView{
                    VStack {
                        if !viewModel.isLoading {
                            if viewModel.weeklyWeatherForecast.count > 0 {
                                List(viewModel.weeklyWeatherForecast){
                                    forecast in
                                    VStack(alignment: .leading) {
                                        HStack {
                                            
                                            if let mainWeatherDescription = forecast.weather?[0].main  {
                                                if mainWeatherDescription == "Clear" {
                                                    Image(systemName:"sun.max")
                                                        .foregroundColor(.yellow)
                                                }else {
                                                    Image(systemName:"cloud")
                                                        .foregroundColor(.gray)
                                                }
                                                Text(mainWeatherDescription)
                                                    .font(.system(size: 15.0))
                                            }else {
                                                Text("")
                                            }
                                            Text((String(forecast.main?.temp ?? 0.0) ?? "") + "°C")
                                                .lineLimit(1)
                                                .font(.system(size: 15.0))
                                            Text("Min:")
                                                .font(.system(size: 15.0))
                                            Text((String(forecast.main?.tempMin ?? 0.0) ?? "") + "°C")
                                                .font(.system(size: 15.0))
                                            Text("Max:")
                                                .font(.system(size: 15.0))
                                            Text((String(forecast.main?.tempMax ?? 0.0) ?? "") + "°C")
                                                .font(.system(size: 15.0))
                                            
                                        }
                                        HStack {
                                            Text("Feels like :")
                                                .font(.system(size: 15.0))
                                            Text((String(forecast.main?.feelsLike ?? 0.0) ?? "") + "°C")
                                                .font(.system(size: 15.0))
                                            Spacer().frame(width: 15.0,height: 5.0)
                                            Image(systemName: "calendar")
                                                .frame(width: 10, height: 10)
                                            Spacer().frame(width: 15.0,height: 5.0)
                                            
                                            Text(viewModel.separateDateAndTime(from: forecast.dateAndTime ?? "")?.date ?? "")
                                                .font(.system(size: 15.0))
                                            if let isAm =     viewModel.separateDateAndTime(from: forecast.dateAndTime ?? "")?.isAm {
                                                
                                                isAm ? Text((viewModel.separateDateAndTime(from: forecast.dateAndTime ?? "")?.time ?? "") + "AM")
                                                    .font(.system(size: 15.0)) : Text((viewModel.separateDateAndTime(from: forecast.dateAndTime ?? "")?.time ?? "" ) + "PM")
                                                    .font(.system(size: 15.0))
                                            }else {
                                                Text("")
                                            }
                                        }
                                    }
                                }.listStyle(.plain)
                                    .accessibilityIdentifier("ForecastList")

                            }else {
                                Text(viewModel.errorMessage)
                            }
                            
                        }
                        else {
                            HStack(spacing: 15) {
                                ProgressView()
                                Text("Loading…")
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView()
    }
}
