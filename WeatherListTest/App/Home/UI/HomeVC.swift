//
//  HomeVC.swift
//  WeatherListTest
//
//  Created by TRAING Serey on 05/07/2019.
//  Copyright © 2019 Sereypich TRAING. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBinding()
    }
    
    func setupBinding() {
        self.tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        
        self.tableView.rx
            .setDelegate(self)
            .disposed(by: self.viewModel.disposeBag)
        
        self.viewModel.weathers.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: "WeatherCell")) { row, model, cell in
                if let weatherCell = cell as? WeatherCell {
                    weatherCell.setupData(weather: model)
                }
            }
            .disposed(by: self.viewModel.disposeBag)
        
        self.tableView.rx.modelSelected(Weather.self)
            .map({ [unowned self] weather in
                Navigator.navigateToDetailWeather(rootController: self, selectedWeather: weather)
            })
            .subscribe()
            .disposed(by: self.viewModel.disposeBag)
        
        self.viewModel.weatherResponseCase
            .asObservable()
            .map({ [unowned self] responseCase in
                switch responseCase {
                case .Error:
                    UIAlertController.okAlert(controller: self, title: "Erreur", message: "Une erreur est survenue")
                    break
                case .Success, .NoState, .NoContent:
                    break
                }
            })
            .subscribe()
            .disposed(by: self.viewModel.disposeBag)
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
