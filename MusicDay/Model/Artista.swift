//
//  Artista.swift
//  MusicDay
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import Foundation
import Firebase

struct Artista {
    var id: String?
    var nombre: String?
    var pais: String?
    var images: String?
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshot.key
        nombre = snapshotValue["nombre"] as? String ?? ""
        pais = snapshotValue["pais"] as? String ?? ""
        images = snapshotValue["images"] as? String ?? ""
    }
    
    init(id: String, nombre: String, pais: String, images: String) {
        self.id = id
        self.nombre = nombre
        self.pais = pais
        self.images = images
    }
    
    func toAny() -> Any {
        return [
            "nombre" : nombre,
            "pais" : pais,
            "images" : images
        ]
    }
}
