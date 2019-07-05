//
//  DetailWeatherViewModel.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift
import RxCocoa

class DetailWeatherViewModel: BaseViewModel {
    var weather                = BehaviorRelay<Weather>(value: Weather())
}
