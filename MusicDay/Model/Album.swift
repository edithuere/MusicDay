//
//  Album.swift
//  MusicDay
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import Foundation
import Firebase

struct Album {
    var id: String?
    var titulo: String?
    var artista: String?
    var images: String?
    var genero: String?
    var disco: String?
    var anio: String?

    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshot.key
        titulo = snapshotValue["titulo"] as? String ?? ""
        artista = snapshotValue["artista"] as? String ?? ""
        images = snapshotValue["images"] as? String ?? ""
        genero = snapshotValue["genero"] as? String ?? ""
        disco = snapshotValue["disco"] as? String ?? ""
        anio = snapshotValue["anio"] as? String ?? ""
    }
    
    init(id: String, titulo: String, artista: String, images: String, genero: String, disco: String, anio: String) {
        self.id = id
        self.titulo = titulo
        self.artista = genero
        self.images = images
        self.genero = genero
        self.disco = disco
        self.anio = anio
    }
    
    func toAny() -> Any {
        return [
            "titulo" : titulo,
            "artista" : artista,
            "images" : images,
            "genero" : genero,
            "disco" : disco,
            "anio" : anio
        ]
    }
}
