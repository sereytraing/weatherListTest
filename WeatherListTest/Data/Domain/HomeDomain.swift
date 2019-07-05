//
//  HomeDomain.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift
import RealmSwift

public final class HomeDomain {
    
    private var weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    //Method with cache URL
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
    
    func getWeatherRealm() -> Observable<[WeatherRealm]> {
        let realm = try! Realm()
        let serviceResponse = realm.objects(ServiceResponseRealm.self)
        if let weathers = serviceResponse.first?.weathers {
            if weathers.isEmpty {
                return Observable.just([])
            } else {
                return Observable.just(Array(weathers))
            }
        }
        return self.weatherRepository.getWeatherRealm().map({ serviceResponse -> [WeatherRealm] in
            if serviceResponse.weathers.isEmpty {
                return []
            } else {
                return Array(serviceResponse.weathers)
            }
        })
    }
}
