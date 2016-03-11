//
//  LoginViewController.swift
//  Hodor Tutoring App
//
//  Created by Jacob Bland on 2/29/16.
//  Copyright © 2016 Team Hodor. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
   
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text

        
        
        
        if(userPassword!.isEmpty || userPassword!.isEmpty)  { return; }
        
        //Send User Specific Data to Server-Side
        
        let myUrl = NSURL(string: "https://cgi.soic.indiana.edu/~team23/validation.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "email=\(userEmail!)&password=\(userPassword!)";
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
    
            
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            func displayMyAlertMessage(userMessage:String)
            {
                
                let myAlert = UIAlertController(title: "Alert", message: "Registration Successful", preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                
                myAlert.addAction(okAction);
                self.presentViewController(myAlert, animated: true, completion: nil);
                
            }
            
            
            
            //dispatch_async(dispatch_get_main_queue())
                    
                    
                    if error != nil {
                        
                        displayMyAlertMessage(error!.localizedDescription)
                        
                        return
                        
                    }
                    
                    
                    
                    do {
                        
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                        
                        
                        
                        print(json)
                        
                        
                        
                        if let parseJSON = json {
                            
                            
                            
                            let resultValue = parseJSON["email"] as? String
                            
                            
                            
                            if( resultValue != nil)
                                
                            {
                                
                                let myAlert = UIAlertController(title: "Alert", message: "Login Successful", preferredStyle: UIAlertControllerStyle.Alert);
                                
                                
                                
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
                    
                    
                    
                    
                    
                    
                    
           
            
            
            
        }).resume()
        
        
        
    }

}
