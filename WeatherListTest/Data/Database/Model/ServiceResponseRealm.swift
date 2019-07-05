//
//  ServiceResponseRealm.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RealmSwift

class ServiceResponseRealm: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var requestState: Int = 0
    @objc dynamic var requestKey: String = ""
    @objc dynamic var message: String = ""
    @objc dynamic var modelRun: String = ""
    @objc dynamic var source: String = ""
    dynamic var weathers = List<WeatherRealm>()

    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(response: ServiceResponse) {
        self.init()
        self.requestState = response.requestState ?? 0
        self.requestKey = response.requestKey ?? ""
        self.message = response.message ?? ""
        self.modelRun = response.modelRun ?? ""
        self.source = response.source ?? ""
        
        
        let tmp = List<WeatherRealm>()
        if let weathers = response.weathers {
            for weather in weathers {
                tmp.append(WeatherRealm(weather: weather))
            }
        }
        self.weathers = tmp
    }
}
