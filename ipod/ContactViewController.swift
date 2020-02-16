//
//  ContactViewController.swift
//  ipod
//
//  Created by Paul Fitzgerald on 15/02/2020.
//  Copyright © 2020 Paul Fitzgerald. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    @IBOutlet weak var contactGender: UILabel!
    @IBOutlet weak var contactMobile: UILabel!
    @IBOutlet weak var contactId: UILabel!
    
    
    var contact = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactName.text = "Name: \(contact["name"] ?? "")"
        contactEmail.text = "Email: \(contact["email"] ?? "")"
        contactGender.text = "Gender: \(contact["gender"] ?? "")"
        contactMobile.text = "Tel: \(contact["mobile"] ?? "")"
        contactId.text = "Id: \(contact["id"] ?? "")"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
