//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Fatih Oğuz on 26.12.2023.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func nextButton(_ sender: Any) {
        
        let authContext = LAContext()
        var error: NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it you?") { success, error in
                if success == true {
                    //succesful auth
                   // DispatchQueue.main.sync {
                       self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                   // }
                    
                }else{
                    //DispatchQueue.main.sync {
                       self.myLabel.text = "Error!"
                   // }
                   
                }
            }
            
        }
    }
    
}

