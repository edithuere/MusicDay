//
//  DetalleAlbumViewController.swift
//  MusicDay
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit
import Kingfisher

class DetalleAlbumViewController: UIViewController {
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var artistaLabel: UILabel!
    @IBOutlet weak var discoLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var anioLabel: UILabel!
    var album : Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let album = album {
            if let image = album.images {
                imageAlbum.kf.setImage(with: URL(string: image))
                tituloLabel.text = album.titulo
                artistaLabel.text = album.artista
                discoLabel.text = album.disco
                generoLabel.text = album.genero
                anioLabel.text = album.anio
            }
            
        }
        
    }
    



}
