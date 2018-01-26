//
//  AddQuoteViewController.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/25/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class AddQuoteViewController: UIViewController {
    
    var delegate: AddQuoteDelegate?
    
    @IBOutlet weak var addQuoteTextField: UITextView!
    
    @IBOutlet weak var authorTextField: UITextField!

    @IBOutlet weak var favoriteSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelQuote(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addQuoteButtonPressed(_ sender: UIButton) {
        
        let quote = self.addQuoteTextField.text
        
        let author = self.authorTextField.text
        
        var favorite = false
        
        if self.favoriteSwitch.isOn {
            favorite = true
        } else {
            favorite = false
        }
        
        let data = NewQuote(quote: quote!, author: author!, favorite: favorite)
        
      self.delegate?.addQuote(by: self, data: data)
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
