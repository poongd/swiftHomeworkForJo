//
//  ViewController.swift
//  Notepad
//
//  Created by lks on 2016. 5. 10..
//  Copyright © 2016년 SwiftBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var cutTextCount = 0         //가운데 커서 이동하고 클릭해서 글자를 추가하는 것을 막기위해 변수 사용
    var cutTextString = ""
    
    @IBOutlet var textCheckLable: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var notepad: UITextField!
    @IBAction func saveButton(sender: AnyObject) {
        
    }
    
    let maxText:Int = 20        //최대 글자 수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        today()         //시작하면서 날짜를 띄우기 위해
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {      //터치 할때마다 키보드 내리기
        self.view.endEditing(true)
    }
}