//
//  LoginViewController.swift
//  MusicDay
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        //validacion de los campos
        guard let correo = correoTextField.text, !correo.isEmpty else {
            //Alerta
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa tu correo", viewController: self)
            return
        }
        guard let contrasena = contrasenaTextField.text, !contrasena.isEmpty else {
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa tu contraseña", viewController: self)
            return
        }
        SVProgressHUD.setForegroundColor(UIColor.blue)
        SVProgressHUD.show()
        //Logica de login
        Auth.auth().signIn(withEmail: correo, password: contrasena) { (auth, error) in
            SVProgressHUD.dismiss()
            if let error = error {
                print(error.localizedDescription)
                AlertHelper().notificationAlert(title: "Error", message: "Ocurrió un error \(error.localizedDescription)", viewController: self)
            }
            //El usuario ya se logueó
            //Mandar a la siguiente vista
            let stb = UIStoryboard(name: "Main", bundle: nil)
            let controller = stb.instantiateViewController(withIdentifier: "tabBarController")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
   
    


}
