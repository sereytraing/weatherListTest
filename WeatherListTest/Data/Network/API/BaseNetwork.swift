//
//  BaseNetwork.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import ObjectMapper
import AlamofireObjectMapper
import CoreLocation

public enum ErrorCodeNetwork: Error {
    case REST_KO_TECHNIQUE
    case REST_NO_CONTENT
    case REST_TOKEN_EXPIRED
}

class BaseNetwork<T: ImmutableMappable> {
    
    private var manager: SessionManager = NetworkManager.shared.manager
    private let scheduler: ConcurrentDispatchQueueScheduler
    private var endPoint: String = "https://www.infoclimat.fr/public-api"
    private var headers: [String: String] = [
        "Content-Type": "application/json"
    ]
    
    init() {
        // Create your own manager instance that uses your custom configuration
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItem(_ path: String, parameters: [String: Any]?) -> Observable<(HTTPURLResponse, T)> {
        // Make your request with your custom manager that is caching your requests by default
        self.manager = NetworkManager.shared.manager
        let absolutePath = "\(self.endPoint)/\(path)"

        return self.manager.rx.request(.get, absolutePath, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers)
            .responseJSON()
            .observeOn(self.scheduler)
            .map({ (response) -> (HTTPURLResponse, T) in
                let object = Mapper<T>().map(JSONObject: response.value)
                if let object = object, let httpUrlResponse = response.response {
                    //It happens if the object of the manager is not retained till execution of the block completes, so this would ensure its retention.
                    //To retain SessionManager instance you need to capture it in closure passed to responseJSON
                    //Otherwise sessionManager is deallocated shortly it goes out of scope and any executing requests are cancelled.
                    self.manager.session.invalidateAndCancel()
                    return (httpUrlResponse, object)
                }
                if let statusCode = response.response?.statusCode, statusCode == 204 {
                    throw ErrorCodeNetwork.REST_NO_CONTENT
                }
                throw ErrorCodeNetwork.REST_KO_TECHNIQUE
            })
    }
}
