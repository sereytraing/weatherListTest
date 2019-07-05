//
//  DependencyManager.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import Foundation

class DependencyManager {
    
    static let shared      = DependencyManager()
    let weatherRepository  : WeatherRepository
    
    init() {
        self.weatherRepository = WeatherRepository()
    }
}
