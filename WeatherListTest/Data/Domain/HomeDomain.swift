//
//  HomeDomain.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift

public final class HomeDomain {
    
    private var weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getWeather() -> Observable<[Weather]> {
        return self.weatherRepository.getWeather().map({ serviceResponse -> [Weather] in
            if let weathers = serviceResponse.weathers {
                if weathers.isEmpty {
                    return []
                } else {
                    return weathers
                }
            }
            return []
        })
    }
}
