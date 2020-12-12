//
//  ViewController.swift
//
//  Created by Nicholas Mel
//  Copyright © 2018 Nicholas Mel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myFoodList:food =  food()
    
    @IBOutlet weak var foodTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFoodList.food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodTableViewCell
        cell.layer.borderWidth = 1.0
        cell.foodTitle.text = myFoodList.cities[indexPath.row].foodName;
        cell.foodImage.image = UIImage(named: myFoodList.food[indexPath.row].foodImageName!)
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle { return UITableViewCellEditingStyle.delete }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        myFoodList.food.remove(at: indexPath.row)
        
        
        //Method 1
        self.foodTable.beginUpdates()
        self.foodTable.deleteRows(at: [indexPath], with: .automatic)
        self.foodTable.endUpdates()
        
    }
    
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Food", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Name of the Food Item Here"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // Do this first, then use method 1 or method 2
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
                let f6 = item(fn: name, fd: "Yum!!!!", fin: "image.jpg")
                self.myFoodList.food.append(f6)
                
                //Method 1
                
                let indexPath = IndexPath (row: self.myFoodList.cities.count - 1, section: 0)
                self.foodTable.beginUpdates()
                self.foodTable.insertRows(at: [indexPath], with: .automatic)
                self.foodTable.endUpdates()
                
            }
        }))
        
        self.present(alert, animated: true)
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex: IndexPath = self.foodTable.indexPath(for: sender as! UITableViewCell)!
        
        let food = myFoodList.food[selectedIndex.row]
        let image = UIImage(named: myFoodList.foood[selectedIndex.row].foodImageName!)
        
        if(segue.identifier == "detailView"){
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedFood = food.foodName!
                viewController.selectedInfo = food.foodDescription!
                viewController.selectedImage = image!
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

