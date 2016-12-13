//
//  ViewController.swift
//  vcard
//
//  Created by Benjamin Dumont on 12/12/2016.
//  Copyright © 2016 bccompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qrCodeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let user = User()
        user.address = "adresse de test"
        user.city = "ville de test"
        user.company = "Company de test"
        user.country = "FRANCE"
        user.email = "bdt@gmail.com"
        user.firstname = "Benjamin"
        user.lastname = "Dumont"
        user.phone = "066666666666"
        user.title = "Titre de test"
        
        let vcard = VCard(user: user)
        let test = vcard.generateVcard()
        
        let image = QRCode(test!)?.image
        qrCodeImageView.image = image;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

