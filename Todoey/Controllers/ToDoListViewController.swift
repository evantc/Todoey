//
//  ViewController.swift
//  Todoey
//
//  Created by EvanC on 18/11/07.
//  Copyright © 2018 EvanC. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Them"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Jane"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Evan"
        itemArray.append(newItem3)
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{
            
            itemArray = items
        
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return itemArray.count
    
}
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // ternary operator
        // value = condition? valueIfTrue : ValueIfFalse

        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true {
//
//            cell.accessoryType = .checkmark
//
//        }else{
//
//            cell.accessoryType = .none
//
//        }
        
        
        return cell
    }
    

    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if itemArray[indexPath.row].done == false {
//
//            itemArray[indexPath.row].done = true
//
//        }else {
//
//            itemArray[indexPath.row].done = false
//
//        }
        
        tableView.reloadData()
        // force tableview to call its data source again
        tableView.deselectRow(at: indexPath, animated: true)
//
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
    
    }

    


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "add a to do ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            
           let newItem = Item()
            
            newItem.title = textField.text!
            
           self.itemArray.append(newItem)
            
           self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
           self.tableView.reloadData()

        }
        
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "create new task"
           
            textField = alertTextField
        }
        
        present(alert,animated: true,completion: nil )
    }
    
}

