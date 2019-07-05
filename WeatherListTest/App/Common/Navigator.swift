//
//  Navigator.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import UIKit

struct Navigator {
    static func navigateToDetailWeather(rootController: UIViewController, selectedWeather: Weather) {
        let storyboard = UIStoryboard(name: "DetailWeather", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailWeatherVC") as? DetailWeatherVC {
            controller.viewModel.weather.accept(selectedWeather)
            rootController.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    static func navigateToDetailWeather(rootController: UIViewController, selectedWeather: WeatherRealm) {
        let storyboard = UIStoryboard(name: "DetailWeather", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailWeatherVC") as? DetailWeatherVC {
            controller.viewModel.weatherRealm.accept(selectedWeather)
            rootController.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
