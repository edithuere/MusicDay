//
//  AlertHelper.swift
//  MusicDay
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center S.A.C. All rights reserved.
//

import UIKit

class AlertHelper : NSObject {
    
    func notificationAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (ac) in
            //Logica en caso se use
        }
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
