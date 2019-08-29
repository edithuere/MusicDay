//
//  RegisterAlbumViewController.swift
//  MusicDay
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit
import Firebase

class RegisterAlbumViewController: UITableViewController {
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var artistaTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var generoTextField: UITextField!
    @IBOutlet weak var discoTextField: UITextField!
    @IBOutlet weak var anioTextField: UITextField!

    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

    }
    
    @IBAction func saveAlbumAction(_ sender: Any) {
        let album = Album(id : "", titulo : tituloTextField.text!, artista : artistaTextField.text!, images : imageTextField.text!, genero : generoTextField.text!, disco : discoTextField.text!, anio : anioTextField.text!)
        ref.child("albumes").childByAutoId().setValue(album.toAny())
        //Alerta
        self.navigationController?.popViewController(animated: true)
    }
    


}
