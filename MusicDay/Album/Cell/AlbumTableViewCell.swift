//
//  ArtistaTableViewCell.swift
//  MusicDay
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var artistaLabel: UILabel!
    @IBOutlet weak var anioLabel: UILabel!
    
    var album : Album? {
        didSet {
            if let album = album {
                if let image = album.images {
                    imageAlbum.kf.setImage(with: URL(string: image))
                    tituloLabel.text = album.titulo
                }
                tituloLabel.text = album.titulo
                artistaLabel.text = album.artista
                anioLabel.text = album.anio
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
