//
//  ThirdViewController.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 24.06.2021.
//

import UIKit

class ThirdViewController: UITableViewController {
 
    var presenter = PresenterThirdVC()
    var indexPathForCell = 0
    var backButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.tableView = self
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SingleTon.shared.arrayWithDetails.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForValues", for: indexPath) as! CellThirdVC
       // let dataFromApi = SingleTon.shared.json![indexPathForCell]
      
        cell.titleLabel.text =  SingleTon.shared.arrayWithDetails[indexPath.row].title
        cell.valueLabel.text = SingleTon.shared.arrayWithDetails[indexPath.row].value

       let blackLine = UIView()
        blackLine.frame = CGRect(x: 20, y: 20, width: 30, height:  3)
        blackLine.backgroundColor = .black
        
        cell.viewForCell.addSubview(blackLine)
        return cell
    }


}
