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
    var cgpa:Double = 0.0
    
    var firstsem:Double = 0.0
    var secondsem:Double = 0.0
    var thirdsem:Double = 0.0
    
    
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
        MADT3004.isHidden = false
        MADT3463.isHidden = false
        MADT3125.isHidden = false
        MADT3115.isHidden = false
        MADT2303.isHidden = false
        course1.isHidden = false
        course2.isHidden = false
        course3.isHidden = false
        course4.isHidden = false
        course5.isHidden = false
//        var totalCgpa = (firstsem + secondsem + thirdsem)
//        totalCgpa = totalCgpa/3
//        print(totalCgpa)
        
    }
    
    func gpaofeachsubject(marks:Double){
       
        //var fourPointScale:Double
        switch (marks) {
            case 0..<50:
          creditofeach = 0.0
       
            case 50...59:
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
       // print("sum is \(sum)")
        //credithours = 3
       // print(creditofeach)
        //print(creditscore)
            let subjectmark2:Double? = Double(course2.text!)
        let c2 =   gpaofeachsubject(marks: subjectmark2 ?? 0)
        sum = creditofeach + sum
       // print(creditofeach)
         //print("sum is \(sum)")
            let subjectmark3:Double? = Double(course3.text!)
        let c3 = gpaofeachsubject(marks: subjectmark3 ?? 0)
        sum = creditofeach + sum
       // print(creditofeach)
        // print("sum is \(sum)")
            let subjectmark4:Double? = Double(course4.text!)
       let c4 =  gpaofeachsubject(marks: subjectmark4 ?? 0)
       // print(creditofeach)
       sum = creditofeach + sum
         //print("sum is \(sum)")
        
            let subjectmark5:Double? = Double(course5.text!)
       
      let c5 =   gpaofeachsubject(marks: subjectmark5 ?? 0)
        //print(creditofeach)
        sum = creditofeach + sum
        // print("sum is \(sum)")
        
        //var totalcredit = creditofeach + creditofeach + creditofeach + creditofeach + creditofeach
        //print(sum)
        
             cgpa = sum / 5
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
    
    @IBAction func semesterselector(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            MADT3004.isHidden = false
            MADT3463.isHidden = false
            MADT3125.isHidden = false
            MADT3115.isHidden = false
            MADT2303.isHidden = false
            MADT3004.text = "MADT3004"
            MADT3463.text = "MADT3463"
            MADT3125.text = "MADT3125"
            MADT3115.text = "MADT3115"
            MADT2303.text = "MADT2303"
            course1.isHidden = false
            course2.isHidden = false
            course3.isHidden = false
            course4.isHidden = false
            course5.isHidden = false
            resultlabel.text = "ex"
            resultlabel.text!  = String(Float(cgpa))
            firstsem = Double(resultlabel.text!)!
            print(firstsem)
            
        case 1:
            MADT3004.isHidden = false
            MADT3463.isHidden = false
            MADT3125.isHidden = false
            MADT3115.isHidden = false
            MADT2303.isHidden = false
            MADT3004.text = "coures1 of sem2"
            MADT3463.text = "coures2 of sem2"
            MADT3125.text = "coures3 of sem2"
            MADT3115.text = "coures4 of sem2"
            MADT2303.text = "coures5 of sem2"
            course1.isHidden = false
            course2.isHidden = false
            course3.isHidden = false
            course4.isHidden = false
            course5.isHidden = false
            resultlabel.text = "result 2"
            resultlabel.text!  = String(Float(cgpa))
            secondsem = Double(resultlabel.text!)!
            print(secondsem)
            
        case 2:
            MADT3004.isHidden = false
            MADT3463.isHidden = false
            MADT3125.isHidden = false
            MADT3115.isHidden = false
            MADT2303.isHidden = false
            MADT3004.text = "coures1 of sem3"
            MADT3463.text = "coures2 of sem3"
            MADT3125.text = "coures3 of sem3"
            MADT3115.text = "coures4 of sem3"
            MADT2303.text = "coures5 of sem3"
            course1.isHidden = false
            course2.isHidden = false
            course3.isHidden = false
            course4.isHidden = false
            course5.isHidden = false
            resultlabel.text = "result 3"
            resultlabel.text!  = String(Float(cgpa))
            thirdsem = Double(resultlabel.text!)!
       print(thirdsem)
            
        default:
         MADT3004.isHidden = true
            MADT3463.isHidden = true
            MADT3125.isHidden = true
            MADT3115.isHidden = true
            MADT2303.isHidden = true
            course1.isHidden = true
            course2.isHidden = true
            course3.isHidden = true
            course4.isHidden = true
            course5.isHidden = true
        
        
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
