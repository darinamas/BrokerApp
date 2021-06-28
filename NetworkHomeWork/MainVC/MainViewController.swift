//
//  ViewController.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 17.06.2021.
//

import UIKit

class MainViewController: UIViewController {
    var presenter = PresenterMainVC()
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lockBtn: UIButton!
    @IBOutlet weak var invalidCredlabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        
        presenter.networkManger()
        setGradient()
        loginViewCustom()
        loginTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
        lockBtn.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        invalidCredlabel.isHidden = true
        
        loginTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged) // observe changes in the Textfield
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func textFieldDidChange(textField: UITextView){
        
        if loginTextField.text!.count >= 3 && passwordTextField.text!.count >= 3 {
            lockBtn.isEnabled = true
            
        } else {
            lockBtn.isEnabled = false
        }
        
    }
    
    
    // MARK: Gradient
    func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        let color1 = UIColor(red: 159/255, green: 77/255, blue: 220/255, alpha: 1)
        let color2 = UIColor(red: 162/255, green: 62/255, blue: 85/255, alpha: 1)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = mainView.layer.frame
        mainView.layer.insertSublayer(gradient, at: 0)
    }
    //MARK: Login View Customization
    func loginViewCustom() {
        let color1 = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        loginView.backgroundColor = color1
        loginView.layer.cornerRadius = 30
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowOpacity = 0.3
        loginView.layer.shadowOffset = CGSize(width: 10,
                                              height: 10)
        loginView.layer.shadowRadius = 5
    }
    
    @IBAction func goButton(_ sender: Any) {
        for elem in SingleTon.shared.validCredentials {
            let saveCred = elem
            if loginTextField.text! == saveCred.username && passwordTextField.text! == saveCred.password{
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
                show(secondVC, sender: nil)
            } else {
                invalidCredlabel.isHidden = false
                print("Invalid credentials")
            }
        }
    }
    
    
    
}
//MARK: Text field line

extension UITextField {
    func setBottomBorder() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        self.layer.shadowOpacity = 3.0
        self.layer.shadowRadius = 0.0
    }
}

