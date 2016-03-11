//
//  RegisterPageViewController.swift
//  Hodor Tutoring App
//
//  Created by Jacob Bland on 2/23/16.
//  Copyright © 2016 Team Hodor. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var userClassStandingTextField: UITextField!
    @IBOutlet weak var userMajorTextField: UITextField!
    @IBOutlet weak var userStudentorTutorTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alreadyhaveaccountButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("alreadyhaveanaccount", sender: self)
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let repeatPassword = repeatPasswordTextField.text;
        let userClassStanding = userClassStandingTextField.text;
        let userMajor = userMajorTextField.text;
        let userStudentorTutor = userStudentorTutorTextField.text;
        
        //Display Registration Confirmation
        func displayMyAlertMessage(userMessage:String)
        {
            
            let myAlert = UIAlertController(title: "Alert", message: "Registration Successful", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated: true, completion: nil);
            
        }
        
        // Check for empty fields
        
        if(userEmail!.isEmpty || userPassword!.isEmpty || repeatPassword!.isEmpty)
        
        {
      
        //Display alert Message
            
            displayMyAlertMessage("All fields are required")
            return;
        }
        
        //Check if passwords match
        
        if(userPassword != repeatPassword)
        
        {
            //Display an Alert message
            
            displayMyAlertMessage("The passwords do not match")
            
            return;
        }
        
        //Send User Specific Data to Server-side
        let myUrl = NSURL(string: "https://cgi.soic.indiana.edu/~team23/index.php/validation.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "email=\(userEmail!)&password=\(userPassword!)&class_standing=\(userClassStanding!)&major=\(userMajor!)&student_or_tutor=\(userStudentorTutor!)";
        
        print(postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        
        
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            
            
            dispatch_async(dispatch_get_main_queue())
            
                {

                    
                    
                    if error != nil {
                        
                        displayMyAlertMessage(error!.localizedDescription)
                        
                        return
                        
                    }
                    
                    
                    
                    do {
                        
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options:
                            .MutableContainers) as? NSDictionary
                        
                        
                        
                        print(json)
                        
                        
                        
                        if let parseJSON = json {
                            
                            
                            
                            let userId = parseJSON["email"] as? String
                            
                            
                            
                            if( userId != nil)
                                
                            {
                                
                                let myAlert = UIAlertController(title: "Alert", message: "Registration successful", preferredStyle: UIAlertControllerStyle.Alert);
                                
                                
                                
                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){(action) in
                                    
                                    
                                    
                                    self.dismissViewControllerAnimated(true, completion: nil)
                                    
                                }
                                
                                
                                
                                myAlert.addAction(okAction);
                                
                                self.presentViewController(myAlert, animated: true, completion: nil)
                                
                            } else {
                                
                                let errorMessage = parseJSON["message"] as? String
                                
                                if(errorMessage != nil)
                                    
                                {
                                    
                                    displayMyAlertMessage(errorMessage!)
                                    
                                }
                                
                                
                                
                            }
                            
                            
                            
                        }
                        
                    } catch{
                        
                        print(error)
                        
                    }
                    
                    
                    
                    
                    
            }
            
            
            
            
            
        }).resume()
        
        
        
        
        
    }
}


