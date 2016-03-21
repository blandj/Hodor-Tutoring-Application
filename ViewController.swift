//
//  ViewController.swift
//  Hodor Tutoring App
//
//  Created by Jacob Bland on 2/19/16.
//  Copyright © 2016 Team Hodor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool)
    
    {
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
        
            self.performSegueWithIdentifier("LoginView", sender: self)
        }
        
        
        
    }
    @IBAction func logoutButtonTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey:"isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        self.performSegueWithIdentifier("LoginView", sender: self)
    }
    
    @IBAction func FAQButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("FAQView", sender: self)
    }
    
    


}

