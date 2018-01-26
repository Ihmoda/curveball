//
//  QuoteListViewController.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/25/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit
import CoreData

class QuoteListViewController: UIViewController, AddQuoteDelegate, UITableViewDelegate, UITableViewDataSource {

   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let headers = ["Favorite Quotes", "Quote Bank"]
    var quotes: [QuoteItem] = []
    var data: [String: [QuoteItem]] = [:]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAll()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.populateData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.headers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let header = self.headers[section]
        
        if (self.data[header] != nil){
            return self.data[header]!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.headers[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("test2")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        
        let header = self.headers[indexPath.section]
        
        let quote = self.data[header]![indexPath.row].quote
        let author = self.data[header]![indexPath.row].author
        
        cell.textLabel?.text = quote
        cell.detailTextLabel?.text = author
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var header = 0
        var otherheader = 1
        if indexPath.section == 1 {
            header = 1
            otherheader = 0
        }
        
        var record = self.data[self.headers[header]]![indexPath.row] as! QuoteItem
        
        
        if record.favorite {
            record.favorite = false
        } else {
            record.favorite = true
        }
        
        self.data[self.headers[header]]!.remove(at: indexPath.row)
        
        if self.data[self.headers[otherheader]] != nil {
            self.data[self.headers[otherheader]]!.append(record)
        } else {
            self.data[self.headers[otherheader]] = [record]
        }
        
        self.tableView.reloadData()

        do {
            try context.save()
        } catch {
            print(error)
        }
        
        
        
        
        
    }
    
    func fetchAll(){
        
        let QuoteItemRequest: NSFetchRequest<QuoteItem> = QuoteItem.fetchRequest()
        
        let QuoteRequest:NSFetchRequest<QuoteItem> = QuoteItem.fetchRequest()
        
        do {
            self.quotes = try context.fetch(QuoteRequest)
        }
        catch {
            print(error)
        }
        
    }
    
    func addQuote(by: AddQuoteViewController, data: NewQuote) {
        
        let new_quote = QuoteItem(context: context)
        
        new_quote.quote = data.quote
        new_quote.author = data.author
        new_quote.favorite = data.favorite
        
        self.quotes.append(new_quote)
        
        do {
            try context.save()
            print("Successfully saved quote to DB")
            print(new_quote)
        } catch {
            print(error)
        }
        
        self.tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuoteSegue" {
            let destination = segue.destination as! AddQuoteViewController
            destination.delegate = self
        }
    }
    
    func populateData(){
        //reinitialize data
        self.data = [:]
        for quote in self.quotes {
            var header = "Quote Bank"
            
            if quote.favorite {
                header = "Favorite Quotes"
            }
            
            if self.data[header] == nil {
                self.data[header] = [quote]
            } else {
                var new_arr = self.data[header] as! [QuoteItem]
                new_arr.append(quote)
                self.data[header] = new_arr
            }
        }
    }
    
}
