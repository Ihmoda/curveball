//
//  DatePickerVC.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/24/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var shortLabel: UILabel!
    
    
    @IBOutlet weak var mediumLabel: UILabel!
    
    
    @IBOutlet weak var longLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        print("datepicker changed")
        let formatter = DateFormatter()
        let actual_date = datePicker.date
        
        formatter.dateStyle = .short
        
        let short_date = formatter.string(from: actual_date)
        
        let medium_date = formatter.string(from: actual_date)
        
        let long_date = formatter.string(from: actual_date)
        
        self.shortLabel.text = short_date
        
        self.mediumLabel.text = medium_date
        
        self.longLabel.text = long_date
        
    
        
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
