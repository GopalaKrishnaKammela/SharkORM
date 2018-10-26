//
//  ViewController.swift
//  SharkORM-Sample
//
//  Created by Gopala Krishna Kammela on 26/04/18.
//  Copyright © 2018 RapidBizApps. All rights reserved.
//

import UIKit
import SharkORM

class ViewController: UIViewController, SRKEventDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var fetchedArray = Array<String>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.fetchedArray.removeAll()
//        for employee in Employee.query().fetch() {
//            let person = employee as! Employee
//            self.fetchedArray.append(person.name)
//        }
//        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) 
    }
    
    //MARK: - UITableViewDataSource, UITableViewDelegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Sample"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.backgroundColor = UIColor.clear
        cell?.textLabel?.text = fetchedArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }
    
    //MARK: - Save Button
    @IBAction func saveAction(_ sender: Any) {
        let eventHandler = Employee.eventHandler()
        eventHandler?.delegate = self
        
        let employee = Employee()
        employee.name = textField.text
        employee.commit()
    }
    
    //MARK: - SRKEventDelegate
    func srkObjectDidRaise(_ e: SRKEvent!) {
        print(e.entity)
        DispatchQueue.main.async {
            self.fetchedArray.removeAll()
            for employee in Employee.query().fetch() {
                let person = employee as! Employee
                self.fetchedArray.append(person.name)
            }
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

