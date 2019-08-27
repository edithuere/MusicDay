//
//  CreateUserViewController.swift
//  MusicDay
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CreateUserViewController: UIViewController {
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CrearUsuarioAction(_ sender: Any) {
        guard let correo = correoTextField.text, !correo.isEmpty else {
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa el usuario", viewController: self)
            return
        }
        guard let contrasena = contrasenaTextField.text, !contrasena.isEmpty else {
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa la contraseña", viewController: self)
            return
        }
        SVProgressHUD.setForegroundColor(UIColor.orange)
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: correo, password: contrasena) { (auth, error) in
            SVProgressHUD.dismiss()
            if let error = error {
                AlertHelper().notificationAlert(title: "Error", message: "Ocurrió un error \(error.localizedDescription)", viewController: self)
                print(error.localizedDescription)
            }
            let alert = UIAlertController(title: "Exito", message: "El usuario ha sido creado", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel) { (ac) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    

}
