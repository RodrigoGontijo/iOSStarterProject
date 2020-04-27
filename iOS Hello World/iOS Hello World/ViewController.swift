//
//  ViewController.swift
//  iOS Hello World
//
//  Created by Rodrigo Augusto Gontijo on 20/04/2020.
//  Copyright © 2020 Rodrigo Augusto Gontijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var multiLineLabel: UILabel!
    
    let dailyTasks = ["Check all windows",
                      "Check all doors",
                      "Is the boiler fueled?",
                      "check the mailbox",
                      "Empty trash containers",
                      "If freezing, check water pipes",
                      "Document \"strange and unusual\" occurrences "]
    
    let weeklyTasks = ["Check inside all cabins",
                       "Flush all lavatories in cabins",
                       "Walk the perimeter of property"]
    
    let monthlyTasks = ["Test security alarm",
                        "Test motion detectors",
                        "Test smoke alarms"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        multiLineLabel.numberOfLines = 0
        multiLineLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
   
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))
         multiLineLabel.isUserInteractionEnabled = true
         multiLineLabel.addGestureRecognizer(tap)
    }
    
    
    @IBAction func changeBackground(_ sender: Any) {
        view.backgroundColor = (view.backgroundColor == UIColor.lightGray) ? UIColor.white : UIColor.lightGray
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        showToastFaded(message: " Funciona DEMAIS")
    }
    
    // Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    
    // Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dailyTasks[indexPath.row]
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
        case 2:
            cell.textLabel?.text = monthlyTasks[indexPath.row]
        default:
            cell.textLabel?.text = "Error"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Section"
        case 1:
            return "Weekly Section"
        case 2:
            return "Monthly Section"
        default:
            return "Default Section"
            
        }
    }
    
    
    func showToastFaded(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}

