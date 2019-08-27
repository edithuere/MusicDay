//
//  AlbumesTableViewController.swift
//  MusicDay
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit
import Firebase

class AlbumesTableViewController: UITableViewController {
    
    var albumes = [Album]()
    var ref : DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getAlbumes()
    }
    
    func getAlbumes() {
        ref.child("albumes").observeSingleEvent(of: .value) { (snapshot) in
            self.albumes = []
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let album = Album(snapshot: child)
                self.albumes.append(album)
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumID", for: indexPath) as! AlbumTableViewCell
        cell.album = self.albumes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    
    
    


}
