//
//  ViewController.swift
//  poongdHomework_notepad
//
//  Created by jsp on 2016. 5. 10..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var noptead_Text: UITextField!
    @IBOutlet var today_Data: UILabel!
    @IBOutlet var textLength_Check: UILabel!
    
    @IBAction func unKnow(sender: UIButton) {
        button_Alram("이것은 버튼입니다", message: "아무 동작도 하지 않아요")
    }
  
    let text_Limit = 20  // limit 20으로 제한
    var text_Maxlength = 0
    var exceptionString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noptead_Text.delegate = self
        today()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}









