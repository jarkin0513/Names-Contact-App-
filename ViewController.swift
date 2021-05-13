//
//  ViewController.swift
//  Array Names
//
//  Created by user167283 on 2/19/21.
//  Copyright © 2021 Jarkin. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var namesTableView: UITableView!
    @IBOutlet weak var addNamesButton: UIBarButtonItem!
    
    //@Outlet weak var
    
    var names = ["Bri", "James", "Matt", "Reed", "Winski", "Kris", "Squid", "Katie", "Kamila"]
    var  pics = [UIImage(named: "bri"), UIImage(named: "james"), UIImage(named: "matt"), UIImage(named: "reed"), UIImage(named: "winski"), UIImage(named: "kris"), UIImage(named: "squid"), UIImage(named: "katie"), UIImage(named: "kamila")]
    var numbers = ["847 912 6706", "847 404 6041", "224 443 0296", "847 687 9610", "847 867 5862", "847 254 7321", "847 363 9280", "847 814 8080", "847 323 3884"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func addNamesButton(_ sender: Any) {
    namesAlert()
    }
    
    func namesAlert() {
        let alertController = UIAlertController(title: "Add Contact", message: "Enter Phone Number", preferredStyle: .alert)
        
        alertController.addTextField { (namesTF) in
            alertController.addTextField { (numberTF) in
            namesTF.placeholder = "Enter Homie Here"
            numberTF.placeholder = "XXX XXX XXXX"
            numberTF.keyboardType = .numberPad
            
        
            
            let addButton = UIAlertAction(title: "ADD", style: .default) { (action) in
            self.names.append(namesTF.text!)
            self.numbers.append(numberTF.text!)
            self.namesTableView.reloadData()
            
            }
            alertController.addAction(addButton)
        }
    }
        present(alertController, animated: true, completion: nil)
    }
    
    //telling the computer how many rows you want
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
        
      
        
    }
    
    //telling the computer what data goes into the row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "namesCell")
        cell?.textLabel?.text = names[indexPath.row]
        cell?.backgroundColor = .lightGray
        cell?.textLabel?.textColor = .black
        cell?.imageView?.image = pics[indexPath.row]
        cell?.detailTextLabel?.text = numbers[indexPath.row]
        
        return cell!
        
    }


}


