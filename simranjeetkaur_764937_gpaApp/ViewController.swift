//
//  ViewController.swift
//  simranjeetkaur_764937_gpaApp
//
//  Created by Simran Chakkal on 2019-11-13.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textString: String?
       var taskTable: studentnametableTableViewController?
    
    @IBOutlet weak var firstnametext: UITextField!
    
    
    @IBOutlet weak var studentidtext: UITextField!
    
    @IBOutlet weak var lastnametext: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstnametext.text = textString ?? ""
        print(firstnametext.text)
        lastnametext.text = textString ?? ""
        print(lastnametext.text)
        studentidtext.text = textString ?? ""
        print(studentidtext.text)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        taskTable?.updateText(text: firstnametext.text!,text1:lastnametext.text! )
        
        
        //
        //taskTable?.updateText(text:studentidtext.text!)
    }
}
