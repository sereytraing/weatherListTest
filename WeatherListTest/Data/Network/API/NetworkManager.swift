//
//  NetworkManager.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    var configuration: URLSessionConfiguration!
    var manager: SessionManager!
    
    init() {
        self.setCachePolicy(requestCachePolicy: .useProtocolCachePolicy)
    }
    
    func setCachePolicy(requestCachePolicy: NSURLRequest.CachePolicy) {
        self.configuration = URLSessionConfiguration.default
        let defaultHeaders = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders
        self.configuration.httpAdditionalHeaders = defaultHeaders
        self.configuration.requestCachePolicy = requestCachePolicy
        self.configuration.urlCache = URLCache.shared
        self.manager = Alamofire.SessionManager.init(configuration: self.configuration)
    }
}
