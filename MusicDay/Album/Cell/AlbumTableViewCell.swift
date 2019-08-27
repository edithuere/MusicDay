//
//  ArtistaTableViewCell.swift
//  MusicDay
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var imageArtista: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var artistaLabel: UILabel!
    @IBOutlet weak var anioLabel: UILabel!
    
    var album : Album? {
        didSet {
            if let album = album {
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
