//
//  AddAnimalViewController.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/25/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class AddAnimalViewController: UIViewController {
    
    var delegate: AddAnimalDelegate?
    
    @IBOutlet weak var animalTextField: UITextField!
    
    @IBOutlet weak var typeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addAnimalButtonPressed(_ sender: UIButton) {
        
        let name = self.animalTextField.text
        let type = self.typeTextField.text
        var animal_data = NewAnimal(name: name!, type: type!)
        
        self.delegate?.addAnimal(by: self, data: animal_data)
        
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
