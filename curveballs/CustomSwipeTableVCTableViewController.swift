//
//  CustomSwipeTableVCTableViewController.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/25/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class CustomSwipeTableVCTableViewController: UITableViewController {
    
    
    var heroes = [
        [
            "name": "Mario",
            "world": "Yoshi's Island",
            "nemesis": "Bowser",
            "toggle": "nemesis"
        ],
        [
            "name": "Batman",
            "world": "Gotham",
            "nemesis": "Catwomen",
            "toggle": ""
        ],
        [
            "name": "Catniss Everdeen",
            "world": "Panem",
            "nemesis": "President Snow",
            "toggle": "world"
        ],
        [
            "name": "Thor",
            "world": "Asgard",
            "nemesis": "Brother",
            "toggle": "world"
        ],
        [
            "name": "Maggie Simpson",
            "world": "Springfield",
            "nemesis": "Bart Simpson",
            "toggle": "world"
        ],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath) as UITableViewCell

        cell.textLabel?.text = self.heroes[indexPath.row]["name"]! as! String
        
        
        
        var statement = ""
        if let test = self.heroes[indexPath.row]["toggle"] {
            if test == "nemesis" {
                statement = "Nemesis: \(self.heroes[indexPath.row]["nemesis"]!)"
            } else if test == "world" {
                statement = "World: \(self.heroes[indexPath.row]["world"]!)"
            } else {
                statement = ""
            }
        }
        
        cell.detailTextLabel?.text = statement
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        
         let selection = self.heroes[editActionsForRowAt.row]["toggle"] as! String
        
        print(selection)
        
        let world = UITableViewRowAction(style: .normal, title: "World") { action, index in
            self.heroes[editActionsForRowAt.row]["toggle"] = "world"
            self.tableView.reloadData()
        }
        
        world.backgroundColor = .red
        
        let nemesis = UITableViewRowAction(style: .normal, title: "Nemesis") { action, index in
            self.heroes[editActionsForRowAt.row]["toggle"] = "nemesis"
            self.tableView.reloadData()
        }
        
        nemesis.backgroundColor = .orange
        
        let clear = UITableViewRowAction(style: .normal, title: "Clear") { action, index in
            self.heroes[editActionsForRowAt.row]["toggle"] = ""
            self.tableView.reloadData()
        }
        
        clear.backgroundColor = .blue
        
        if selection == "world" {
            return [nemesis, clear]
        } else if selection == "nemesis" {
            return [world, clear]
        }  else {
            return [world, nemesis]
        }
    }


}
