//
//  ViewController.swift
//  simranjeetkaur_764937_gpaApp
//
//  Created by Simran Chakkal on 2019-11-13.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class studentregistrationViewController: UIViewController {
//    var textString: String?
       var taskTable: studentnametableTableViewController?
//    var firstlastname:String?
//    var studentnames:String?
    
    @IBOutlet weak var firstnametext: UITextField!
    
    
    @IBOutlet weak var studentidtext: UITextField!
    
    @IBOutlet weak var lastnametext: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    
    @IBAction func savebutton(_ sender: UIButton) {
        let  firstname = self.firstnametext.text!
        let lastname = self.lastnametext.text!
        let studentid = self.studentidtext.text!
       // let studentsregistration = studentname(firstname: firstname, lastname: lastname , studentid: studentid)
        //studentname.students.append(studentsregistration)
//        self.firstnametext.text = nil
//        self.lastnametext.text = nil
//        self.studentidtext.text = nil
        
        
        if firstnametext.text?.isEmpty ?? true && lastnametext.text?.isEmpty ?? true{
            let alertempty = UIAlertController(title: "WARNING! Textfields is empty", message: "Fill the textfields", preferredStyle: .alert)
            let okactionempty = UIAlertAction(title: "ok", style: .cancel ,handler: nil)
            alertempty.addAction(okactionempty)
            self.present(alertempty,animated: true,completion: nil)

        }
        else {
        
        let alertsheet = UIAlertController(title: "Save student", message: "Are you sure?", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "No way", style: .cancel, handler: nil)
        let oksheet = UIAlertAction(title: "Yes, I am sure", style:  .default){ (action) in
            let alertaction = UIAlertController(title: "New student saved", message: "\(firstname) is now a student", preferredStyle: .alert)
            let okaction = UIAlertAction(title: "ok", style: .default ){(action) in
                //let studentsregistration = studentname(firstname: firstname, lastname: lastname , studentid: studentid)
              //  studentname.students.append(studentsregistration)
                var alreadyexit = false
                for items in studentname.students{
                    if items.studentid == studentid{
                       
                        
                       alreadyexit = true
                    break
                    }
                }
                if alreadyexit{
                    let alert = UIAlertController(title: "id taken", message: "please choose a different id", preferredStyle: .alert)
                    let idaction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                    alert.addAction(idaction)
                    self.present(alert , animated: true,completion: nil)
                }
                else{
                    let studentsregistration = studentname(firstname: firstname, lastname: lastname , studentid: studentid)
                    studentname.students.append(studentsregistration)
                }
                
            }
            alertaction.addAction(okaction)
            self.present(alertaction,animated: true,completion: nil)

        }
        alertsheet.addAction(cancel)
        alertsheet.addAction(oksheet)
        
        self.present(alertsheet,animated: true,completion: nil)
        }
    
        }
    
   
    

    
    override func viewWillDisappear(_ animated: Bool) {
        
        taskTable?.tableView.reloadData()
        
        //
        //taskTable?.updateText(text:studentidtext.text!)
    }
}
