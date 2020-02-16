//
//  ViewController.swift
//  ipod
//
//  Created by Paul Fitzgerald on 15/02/2020.
//  Copyright © 2020 Paul Fitzgerald. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate   {
    
    var contacts = [[String : String]]()
    var contactForSegue = [String : String]()
    
    @IBOutlet weak var contactTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        var dict = contacts[indexPath.row]
        cell.textLabel?.text = dict["name"]
        cell.detailTextLabel?.text = dict["email"]
        return cell
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contacts"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactForSegue = contacts[indexPath.row]
        self.performSegue(withIdentifier: "ContactViewController", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactViewController = segue.destination as! ContactViewController
        contactViewController.contact = contactForSegue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContacts()
    }

    func getContacts() {
        request("https://api.androidhive.info/contacts/").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_, subJson) in json["contacts"] {
                    let contactDetails = [
                        "name": subJson["name"].string,
                        "email": subJson["email"].string,
                        "address": subJson["address"].string,
                        "gender": subJson["gender"].string,
                        "id": subJson["id"].string,
                        "mobile": subJson["phone"]["mobile"].string
                    ]
                    self.contacts.append(contactDetails as! [String : String])
                }
                
                self.contactTable.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

