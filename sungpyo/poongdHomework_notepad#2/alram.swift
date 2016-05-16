//
//  alram.swift
//  poongdHomework_notepad
//
//  Created by jsp on 2016. 5. 13..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit

extension ViewController {
    func button_Alram(title:String, message:String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}