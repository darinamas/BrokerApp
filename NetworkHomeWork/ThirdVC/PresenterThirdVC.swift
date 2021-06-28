//
//  PresenterThirdVC.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 24.06.2021.
//

import Foundation

class PresenterThirdVC {
    var tableView: ThirdViewController?
    
    func networkManger () {
        let networkManager = NetworkManager()
        networkManager.get { json in
            SingleTon.shared.json = json            
            DispatchQueue.main.async { 
                print("Hello json")
               
            }
        }
    }
    
//    func addElemeToArray(){
//       
//        SingleTon.shared.arrayForDetails.append(SingleTon.shared.json![tableView!.indexPathForCell].ask)
//        SingleTon.shared.arrayForDetails.append(SingleTon.shared.json![tableView!.indexPathForCell].bid)
//        SingleTon.shared.arrayForDetails.append(SingleTon.shared.json![tableView!.indexPathForCell].change)
//        SingleTon.shared.arrayForDetails.append(SingleTon.shared.json![tableView!.indexPathForCell].change24h)
//    }
}
