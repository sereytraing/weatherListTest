//
//  HomeViewModel.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift
import RxCocoa

enum BaseResponseCase {
    case Success
    case Error
    case NoState
    case NoContent
}

class HomeViewModel: BaseViewModel {
    
    //var weathers                = BehaviorRelay<[Weather]>(value: [])
    var weathersRealm           = BehaviorRelay<[WeatherRealm]>(value: [])
    var weatherResponseCase     = BehaviorRelay<BaseResponseCase>(value: .NoState)
    var domain                  : HomeDomain
    let disposeBag              = DisposeBag()
    
    override init() {
        self.domain = HomeDomain(weatherRepository: DependencyManager.shared.weatherRepository)
        super.init()
        self.getWeather()
    }
    
    func getWeather() {
        self.loaderIsHidden.accept(false)
        //If there is Cache URL
        //self.domain.getWeather()
        
        //With Realm
        self.domain.getWeatherRealm()
            .observeOn(MainScheduler.instance)
            .asSingle()
            .map({ weathers in
                if weathers.isEmpty {
                    self.weatherResponseCase.accept(.NoContent)
                } else {
                    self.weathersRealm.accept(weathers)
                    self.weatherResponseCase.accept(.Success)
                }
            })
            .subscribe(
                onError: { e in
                    self.loaderIsHidden.accept(true)
                    self.weatherResponseCase.accept(.Error)
            })
            .disposed(by: self.disposeBag)
    }
    
    func forceGetWeather() {
        self.weatherResponseCase.accept(.NoState)
        self.domain.forceGetWeatherRealm()
            .observeOn(MainScheduler.instance)
            .asSingle()
            .map({ weathers in
                if weathers.isEmpty {
                    self.weatherResponseCase.accept(.NoContent)
                } else {
                    self.weathersRealm.accept(weathers)
                    self.weatherResponseCase.accept(.Success)
                }
            })
            .subscribe(
                onError: { e in
                    self.loaderIsHidden.accept(true)
                    self.weatherResponseCase.accept(.Error)
            })
            .disposed(by: self.disposeBag)
    }
}
