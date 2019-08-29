//
//  UserTableViewController.swift
//  MusicDay
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit
import Firebase

class UserTableViewController: UITableViewController {
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidosTextField: UITextField!
    @IBOutlet weak var correoTexField: UITextField!
    @IBOutlet weak var edadTexField: UITextField!
    var ref : DatabaseReference!
    var userUid : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getUserInfo()
    }

    
    func getUserInfo() {
        //SVProgressHUD
        if let uid = UserDefaults.standard.object(forKey: "uid") as? String {
            self.userUid = uid
            ref.child("users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
                //SVProgressHUD dismiss
                let user = User(snapshot: snapshot)
                self.nombreTextField.text = user.nombre
                self.apellidosTextField.text = user.apellidos
                self.edadTexField.text = user.edad
                self.correoTexField.text = user.correo
            }
        }
    }

    @IBAction func saveAtion(_ sender: Any) {
        guard let nombre = nombreTextField.text else {
            return
        }
        guard let apellidos = apellidosTextField.text else {
            return
        }
        guard let edad = edadTexField.text else {
            return
        }
        guard let correo = correoTexField.text else {
            return
        }
        if let uid = userUid {
            let user = User(id: uid, nombre: nombre, apellidos: apellidos, correo: correo, edad: edad)
            //Actualizar la información
            ref.child("users").child(uid).setValue(user.toAny())
            let alert = UIAlertController(title: "Exito", message: "El usuario ha sido actualizado", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel) { (ac) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }



}
