//
//  User.swift
//  MusicDay
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import Foundation
import Firebase

struct User {
    var id: String?
    var nombre: String?
    var apellidos: String?
    var correo: String?
    var edad: String?
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshot.key
        nombre = snapshotValue["nombre"] as? String ?? ""
        apellidos = snapshotValue["apellidos"] as? String ?? ""
        correo = snapshotValue["correo"] as? String ?? ""
        edad = snapshotValue["edad"] as? String ?? ""
    }
    
    init(id: String, nombre: String, apellidos: String, correo: String, edad: String) {
        self.id = id
        self.nombre = nombre
        self.apellidos = apellidos
        self.correo = correo
        self.edad = edad
    }
    
    func toAny() -> Any {
        return [
            "nombre" : nombre,
            "apellidos" : apellidos,
            "correo" : correo,
            "edad" : edad
        ]
    }
}
