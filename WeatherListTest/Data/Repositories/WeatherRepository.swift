//
//  WeatherRepository.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift

public final class WeatherRepository {
    
    private let network = WeatherNetwork()
    
    init() {}
    
    func getWeather() -> Observable<ServiceResponse> {
        NetworkManager.shared
            .setCachePolicy(requestCachePolicy: .useProtocolCachePolicy)
        return self.network.getWeather()
    }
}
