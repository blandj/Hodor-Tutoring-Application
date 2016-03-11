//
//  FAQViewController.swift
//  Hodor Tutoring App
//
//  Created by Jacob Bland on 3/7/16.
//  Copyright © 2016 Team Hodor. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backtohomeButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("backtohome", sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
