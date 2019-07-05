//
//  WeatherRepository.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift
import RealmSwift

public final class WeatherRepository {
    
    private let network = WeatherNetwork()
    
    init() {}
    
    //First method - Use Cache URL
    //If there is Cache-Control with a value > 0, in the header of the response
    //We can call the same method until the cache is expired
    //With InfoClimat API, Cache-Control = 0, so we can't use it but I think, it's one of the best way to use cache data
    // Pro -> No need to add Realm, cache url lighter
    func getWeather() -> Observable<ServiceResponse> {
        NetworkManager.shared
            .setCachePolicy(requestCachePolicy: .useProtocolCachePolicy)
        return self.network.getWeather()
    }
    
    //Second method - Realm
    //Realm is a mobile database that runs directly inside phones
    //We can use saved data without internet
    func getWeatherRealm() -> Observable<ServiceResponseRealm> {
        return self.network.getWeather()
            .map({ serviceResponse -> ServiceResponseRealm in
                let realm = try! Realm()
                let realmObject = ServiceResponseRealm(response: serviceResponse)
                DispatchQueue.main.async {
                    try! realm.write {
                        realm.add(realmObject, update: true)
                    }
                }
                return realmObject
            })
    }
}
