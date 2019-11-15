//
//  studentnametableTableViewController.swift
//  simranjeetkaur_764937_gpaApp
//
//  Created by Simran Chakkal on 2019-11-13.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class studentnametableTableViewController: UITableViewController {
 var currentindex = -1
    var studentname:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentname?.count ?? 0
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               if let cell = tableView.dequeueReusableCell(withIdentifier: "studentcell"){
                 
                   let arrayname = studentname![indexPath.row]
                  
                   cell.textLabel?.text = arrayname
                       
                   //cell.imageView?.image = UIImage(named: "folder-icon")
                   // Configure the cell..
                   return cell
               }
                  return UITableViewCell()
                   
           }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            if let detailView = segue.destination as? ViewController{
                detailView.taskTable = self
            if let tableviewcell = sender as?UITableViewCell{
                   if let index = tableView.indexPath(for: tableviewcell)?.row
                    {
                       detailView.textString = studentname![index]
                    currentindex = index
                    }
                }
            }
            
    }
    
    
    func updateText(text: String,text1:String) {
            
            
            if studentname != nil && currentindex != -1{
                studentname![currentindex] = text
                let indexpath = IndexPath(item: currentindex, section: 0)
                tableView.reloadRows(at: [indexpath], with: .none)
                currentindex = -1
            }
            
            else if studentname != nil && currentindex == -1{
            var first = studentname?.append(text)
            tableView.reloadData()
               
                print(first)
                
                var last = studentname?.append(text1)
                print(last)
                
                //UserDefaults.standard.set(text, forKey: "mynotes")
                
              //(first,"",last)
                
        }
    }

}
