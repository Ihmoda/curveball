//
//  SwitchVC.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/24/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class SwitchVC: UIViewController {
    

    @IBOutlet weak var onOffSwitch: UILabel!
    
    @IBOutlet weak var specialSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if self.specialSwitch.isOn {
            self.onOffSwitch.text = "The switch is on!"
        } else {
            self.onOffSwitch.text = "The switch is off!"
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
