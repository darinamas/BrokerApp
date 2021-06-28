//
//  PresenterMainVC.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 23.06.2021.
//

import Foundation

class PresenterMainVC {
    var view: MainViewController?

    
    
    func networkManger () {
        let networkManager = NetworkManager()
        networkManager.get { json in
            SingleTon.shared.json = json
            DispatchQueue.main.async {
                print("Hi JSON")
            }
        }
    }
 
}
