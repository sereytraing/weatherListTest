//
//  ServiceResponse.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import ObjectMapper

struct ServiceResponse {
    var requestState: Int?
    var requestKey: String?
    var message: String?
    var modelRun: String?
    var source: String?
    var weathers: [Weather]?
    
    init() {
    }
}

extension ServiceResponse: ImmutableMappable {
    
    // JSON -> Object
    init(map: Map) throws {
        self.requestState = try? map.value("request_state")
        self.requestKey = try? map.value("request_key")
        self.message = try? map.value("message")
        self.modelRun = try? map.value("model_run")
        self.source = try? map.value("source")
      
        var isFinished = false
        var allWeathersTmp = [Weather]()
        var weatherTmp: Weather?
        var date = Date()
        let hoursInterval = ["02:00:00", "05:00:00", "08:00:00", "11:00:00", "14:00:00", "17:00:00", "20:00:00", "23:00:00"]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let resultDate = formatter.string(from: date)
        var nbDay = 0
        
        while !isFinished {
            for hour in hoursInterval {
                let tmp = "\(resultDate) \(hour)"
                weatherTmp = try? map.value(tmp) as Weather
                if weatherTmp != nil {
                    allWeathersTmp.append(weatherTmp!)
                }
            }
            if let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: date) {
                date = nextDay
                nbDay += 1
            } else {
                isFinished = true
            }
            
            if nbDay == 7 {
                isFinished = true
            }
        }
        self.weathers = allWeathersTmp
    }
}
