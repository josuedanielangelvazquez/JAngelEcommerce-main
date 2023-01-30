//
//  usuariologin.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 17/01/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseAnalytics

class usuariologin: UIViewController{
    
   
    @IBOutlet weak var pasword: UITextField!
    @IBOutlet weak var correo: UITextField!
    
    
    @IBOutlet weak var EmailLoguintext: UITextField!
    @IBOutlet weak var PaswordLoguintext: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Autenticacion"
        
    }
    func loguinresgister(){
        Analytics.logEvent("InitScreen", parameters: ["message" : "Integracion de Firebase  completa"])
    }
    
    
    
    @IBAction func EntrarAction(_ sender: UIButton) {
        if let email = correo.text, let password = pasword.text{
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                if let result = result, error == nil{
                    self.performSegue(withIdentifier: "seguesInicio", sender: nil)
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "Ingrese credenciales validas", preferredStyle: .alert)
                    let Ok = UIAlertAction(title: "oK", style: .default)
                    alert.addAction(Ok)
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @IBAction func MoreInfoAction(_ sender: UIButton) {
    }
    
    
    
    @IBAction func ResgistrarseAction(_ sender: UIButton) {
        if let email = EmailLoguintext.text, let password = PaswordLoguintext.text{
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                if let result = result, error == nil{
                    self.navigationController
                    let alert = UIAlertController(title: "Ok", message: "Registro Completado", preferredStyle: .alert)
                    let Ok = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(Ok)
                    self.present(alert, animated: true)
                    
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "Ocurrio un Error", preferredStyle: .alert)
                    let Ok = UIAlertAction(title: "oK", style: .default)
                    alert.addAction(Ok)
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
