//
//  RefinedFetchViewController.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/25/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit
import CoreData

class RefinedFetchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddAnimalDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var animals: [Animal] = []
    

    @IBOutlet weak var fetchTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAll()
        self.fetchTableView.dataSource = self
        self.fetchTableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fetchCell", for: indexPath)
        
        cell.textLabel?.text = self.animals[indexPath.row].name
        
        return cell
        
    }
    
    func fetchAll(){
        
        let animal_request: NSFetchRequest<Animal> = Animal.fetchRequest()
        
        do {
            self.animals = try context.fetch(animal_request)
        } catch {
            print(error)
        }
        
    }
    

    func fetchMammals(){
        
        let animal_request: NSFetchRequest<Animal> = Animal.fetchRequest()
        
        let animal = "mammal"
        
        animal_request.predicate = NSPredicate(format: "type == %@", animal)
        
        do {
            self.animals = try context.fetch(animal_request)
        } catch {
            print(error)
        }
        
    }
    
    func fetchReptiles(){
        
        let animal_request: NSFetchRequest<Animal> = Animal.fetchRequest()
        
        let animal = "reptile"
        
        animal_request.predicate = NSPredicate(format: "type == %@", animal)
        
        do {
            self.animals = try context.fetch(animal_request)
        } catch {
            print(error)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAnimalSegue" {
            
            let destination = segue.destination as! AddAnimalViewController
            destination.delegate = self
            
        }
    }
    
    
    func addAnimal(by: AddAnimalViewController, data: NewAnimal) {
        
        let new_animal = Animal(context: context)
        new_animal.name = data.name
        new_animal.type = data.type
        
        self.animals.append(new_animal)
        self.fetchTableView.reloadData()
        
        do {
            try context.save()
            print("saved successfully")
        } catch {
            print("error")
        }
        dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func showAllAnimalsPressed(_ sender: UIButton) {
        self.fetchAll()
        self.fetchTableView.reloadData()
    }
    
    @IBAction func showOnlyReptilesPressed(_ sender: UIButton) {
        
        self.fetchReptiles()
        self.fetchTableView.reloadData()
        
    }
    
    @IBAction func showAllMammalsPressed(_ sender: UIButton) {
        self.fetchMammals()
        self.fetchTableView.reloadData()
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

