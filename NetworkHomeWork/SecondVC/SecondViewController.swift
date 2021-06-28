//
//  SecondViewController.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 24.06.2021.
//

import UIKit

class SecondViewController: UITableViewController {
    var presenter = PresenterSecondVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.tableView = self
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 250, green: 250, blue: 250, alpha: 1) //color of the refresh btn
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter.networkManger()
        tableView.reloadData()
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingleTon.shared.json!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellBroker", for: indexPath) as! CellSecondVC
        let dataFromApi: [ModelTypeForDecode]? = SingleTon.shared.json
        
        cell.labelForCell.text = dataFromApi![indexPath.row].symbol
        cell.askTextLabel.text = "\(dataFromApi![indexPath.row].ask)"

        //Cell custom
        
        cell.viewForCell.layer.borderColor = UIColor.black.cgColor
        cell.viewForCell.layer.cornerRadius = 15
        cell.viewForCell.clipsToBounds = true
        cell.viewForCell.layer.shadowColor = UIColor.black.cgColor
        cell.viewForCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
   
        cell.viewForCell.layer.shadowRadius = 2.0
        cell.viewForCell.layer.shadowOpacity = 0.5
        cell.viewForCell.layer.masksToBounds = false
        
//MARK: Color indicator for cell
        let colorIndic = UIView()
        colorIndic.frame = CGRect(x: 10, y: 10, width: 5, height: 40)
        if dataFromApi![indexPath.row].change > 0 {
            colorIndic.backgroundColor = .green
        } else if  dataFromApi![indexPath.row].change < 0 {
            colorIndic.backgroundColor = .red
        } else if dataFromApi![indexPath.row].change == 0 {
            colorIndic.backgroundColor = .yellow
        }

        cell.viewForCell.addSubview(colorIndic)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.addDetailsDatafromJson(indexPath: indexPath) // added date to new array for details
        let storBoard = UIStoryboard(name: "Main", bundle: nil)
        let thirdVC = storBoard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
        thirdVC.indexPathForCell = indexPath.row
        show(thirdVC, sender: nil)
    }

    @IBAction func refresh(_ sender: Any) {
        presenter.networkManger()
        tableView.reloadData()
    }
    
    

 
}
