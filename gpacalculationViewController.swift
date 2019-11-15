//
//  gpacalculationViewController.swift
//  simranjeetkaur_764937_gpaApp
//
//  Created by Simran Chakkal on 2019-11-15.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class gpacalculationViewController: UIViewController {
    var standardGPA:Double = 0
    var creditofeach:Double = 0.0
    var credithours:Double = 0.0
    var grade:Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func gpaofeachsubject(){
       
        //var fourPointScale:Double
        switch (standardGPA) {
            case 0..<50:
               // standardGPALabel.textColor = .black
               // letterGradeLabel.textColor = .black
                creditofeach = 0.0
                //letter = "F"
            case 50...59:
//                standardGPALabel.textColor = .red
//                letterGradeLabel.textColor = .red
                creditofeach = 1.0
               // letter = "D"
            case 60...62:
//                standardGPALabel.textColor = .red
//                letterGradeLabel.textColor = .red
                creditofeach = 1.7
                //letter = "C-"
            
            case 63...66:
//                standardGPALabel.textColor = .orange
//                letterGradeLabel.textColor = .orange
                creditofeach = 2.0
                //letter = "C"
            case 67...69:
//                standardGPALabel.textColor = .orange
//                letterGradeLabel.textColor = .orange
               creditofeach = 2.3
                //letter = "C+"
            case 70...72:
//                standardGPALabel.textColor = .yellow
//                letterGradeLabel.textColor = .yellow
                creditofeach = 2.7
               // letter = "B-"
            case 73...76:
//                standardGPALabel.textColor = .yellow
//                letterGradeLabel.textColor = .yellow
                creditofeach = 3.0
               // letter = "B"
            case 77...79:
//                standardGPALabel.textColor = .yellow
//                letterGradeLabel.textColor = .yellow
                creditofeach = 3.2
                //letter = "B+"
            case 80...86:
//                standardGPALabel.textColor = .green
//                letterGradeLabel.textColor = .green
                creditofeach = 3.5
               // letter = "A-"
            case 87...93:
//                standardGPALabel.textColor = .green
//                letterGradeLabel.textColor = .green
                creditofeach = 3.7
               // letter = "A"
            case 94...100:
//                standardGPALabel.textColor = .green
//                letterGradeLabel.textColor = .green
               creditofeach = 4.0
               // letter = "A+"
            default:
                break
        }
       creditofeach = credithours * standardGPA
    }
    
    
    @IBAction func calculategpa(_ sender: UIButton) {
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
