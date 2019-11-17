//
//  gpacalculationViewController.swift
//  simranjeetkaur_764937_gpaApp
//
//  Created by Simran Chakkal on 2019-11-15.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit
import AVFoundation

class gpacalculationViewController: UIViewController {
    var marks:Double = 0.0
    var creditofeach:Double = 0.0
    var credithours:Double = 0.0
    var grade:Character?
    var creditscore:Double = 0.0
    var bombSoundEffect: AVAudioPlayer?
    
    @IBOutlet weak var course1: UITextField!
    
    @IBOutlet weak var MADT3125: UILabel!
    
    @IBOutlet weak var MADT3115: UILabel!
    @IBOutlet weak var MADT3004: UILabel!
    
    @IBOutlet weak var MADT3463: UILabel!
    @IBOutlet weak var MADT2303: UILabel!
    @IBOutlet weak var course2: UITextField!
    
    @IBOutlet weak var course3: UITextField!
    @IBOutlet weak var course4: UITextField!
    
    
    @IBOutlet weak var course5: UITextField!
    
    
    @IBOutlet weak var resultlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var subjectmark:Double? = Double(course1.text!)
        self.course1.becomeFirstResponder()
        self.course2.becomeFirstResponder()
    }
    
    func gpaofeachsubject(marks:Double){
       
        //var fourPointScale:Double
        switch (marks) {
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
       creditscore = credithours * creditofeach
    }
    
    
    
    
    
    
    
    
    
    @IBAction func calculategpa(_ sender: UIButton) {
        
        if course1.text?.isEmpty ?? true && course2.text?.isEmpty ?? true && course3.text?.isEmpty ?? true && course4.text?.isEmpty ?? true && course5.text?.isEmpty ?? true {
            print("text is empty")
            let alertempty1 = UIAlertController(title: "WARNING! Textfields is empty", message: "Fill the textfields", preferredStyle: .alert)
            let okactionempty1 = UIAlertAction(title: "ok", style: .cancel ,handler: nil)
            alertempty1.addAction(okactionempty1)
            self.present(alertempty1,animated: true,completion: nil)

        }
    
        else{
        
        
        let  subjectmark1:Double? = Double(course1.text!)
        let lastnum = MADT3004.text!
        
//        var removelast = Int(lastnum.removeLast())
//       print(removelast)
        
        let c1 =  gpaofeachsubject(marks: subjectmark1 ?? 0)
        var hours = creditofeach
        
        var sum = creditofeach + 0
        print("sum is \(sum)")
        //credithours = 3
        print(creditofeach)
        //print(creditscore)
        var subjectmark2:Double? = Double(course2.text!)
        let c2 =   gpaofeachsubject(marks: subjectmark2 ?? 0)
        sum = creditofeach + sum
        print(creditofeach)
         print("sum is \(sum)")
        var subjectmark3:Double? = Double(course3.text!)
        let c3 = gpaofeachsubject(marks: subjectmark3 ?? 0)
        sum = creditofeach + sum
        print(creditofeach)
         print("sum is \(sum)")
        var subjectmark4:Double? = Double(course4.text!)
       let c4 =  gpaofeachsubject(marks: subjectmark4 ?? 0)
        print(creditofeach)
       sum = creditofeach + sum
         print("sum is \(sum)")
        
        var subjectmark5:Double? = Double(course5.text!)
       
      let c5 =   gpaofeachsubject(marks: subjectmark5 ?? 0)
        print(creditofeach)
        sum = creditofeach + sum
         print("sum is \(sum)")
        
        //var totalcredit = creditofeach + creditofeach + creditofeach + creditofeach + creditofeach
        print(sum)
        
        var cgpa = sum / 5
        print(cgpa)
         resultlabel.text!  = String(Float(cgpa))
        if cgpa >= 2.8 {
            let path = Bundle.main.path(forResource: "Win.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
                bombSoundEffect?.play()
            } catch {
                // couldn't load file :(
            }
            }
        }
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
