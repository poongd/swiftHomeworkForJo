//
//  PopupViewController.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 7. 27..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit


class PopupViewController: UIViewController {
    
    @IBOutlet weak var popUpTextV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func closePopUp(sender: AnyObject){
        self.view.removeFromSuperview()
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
