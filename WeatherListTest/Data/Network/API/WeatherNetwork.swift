//
//  WeatherNetwork.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import RxSwift

public class WeatherNetwork {
    
    func getWeather() -> Observable<ServiceResponse> {
        let baseNetwork: BaseNetwork<ServiceResponse> = BaseNetwork()
        let path = "gfs/json?_ll=48.85341,2.3488&_auth=UUsHEAN9XH4HKgQzB3EDKlY%2BBDFaLAIlBHgEZ1s%2BVitROlU0BGRRN1Q6USwHKAcxVXgGZQkyAzMLYAR8WCpfPlE7B2sDaFw7B2gEYQcoAyhWeARlWnoCJQRuBGBbKFY1USxVNARlUS1UOlEwBz8HLFV5BmcJMwM9C2oEYFg0XzhRNgdkA2lcIQd3BGMHYwM2VjMEZFpjAm8EMQRjWz9WNVE1VTAEYVEtVDNRMgc%2FBzVVZQZjCTcDPAt3BHxYTF9PUS8HIwMiXGsHLgR7B2IDaVYx&_c=cd31c0e16766fe28e4f27befa1ab9df7"
        let response: Observable<(HTTPURLResponse, ServiceResponse)> = baseNetwork.getItem(path, parameters: nil)
        return response.map({ responseUrl, serviceResponse in
            if let requestState = serviceResponse.requestState, responseUrl.statusCode == 200 && requestState == 200 {
                return serviceResponse
            }  else if responseUrl.statusCode == 204 {
                throw ErrorCodeNetwork.REST_NO_CONTENT
            } else {
                throw ErrorCodeNetwork.REST_KO_TECHNIQUE
            }
        })
    }
}
