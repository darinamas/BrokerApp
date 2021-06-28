//
//  PresenterSecondVC.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 24.06.2021.
//

import Foundation

class PresenterSecondVC {
    var tableView: SecondViewController?
    
    func networkManger () {
        let networkManager = NetworkManager()
        networkManager.get { json in
            SingleTon.shared.json = json
            DispatchQueue.main.async {
                self.tableView?.tableView.reloadData()
                print("Hi JSON PresenterSecondVC")
            }
        }
    }
    func addDetailsDatafromJson(indexPath: IndexPath) {
        let dataFromApi = SingleTon.shared.json![indexPath.row]
       
        SingleTon.shared.arrayWithDetails = []
        SingleTon.shared.arrayWithDetails.append(DetailsData(title: "Ask", value: String(dataFromApi.ask)))
        SingleTon.shared.arrayWithDetails.append(DetailsData(title: "Bid", value: String(dataFromApi.bid)))
        SingleTon.shared.arrayWithDetails.append(DetailsData(title: "Change", value: String(dataFromApi.change)))
        SingleTon.shared.arrayWithDetails.append(DetailsData(title: "Change24", value: String(dataFromApi.change24h)))

    }

}
