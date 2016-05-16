//
//  ViewController.swift
//  poongdHomework_notepad
//
//  Created by jsp on 2016. 5. 10..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()  // 리턴키 입력(true) 시 키보드 내리기
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true) // 바탕 터치하면 키보드 내리기
    }
    
    func textFieldDidChange(textField: UITextField) {
        
        if var unverifiedText = notepad_Text.text where unverifiedText.characters.count > text_Limit{ //텍스트필드 내 글자수가 보다 크거나 같을경우.
            
            if text_length == text_Limit {
                notepad_Text.text = previousText
                
            } else {
                let Text_removeRange = unverifiedText.startIndex.advancedBy(text_Limit)..<unverifiedText.endIndex //텍스트필드의 시작지점의 5번째부터~끝까지 Text_removeRange에 입력.
                    unverifiedText.removeRange(Text_removeRange)
              }
        }
        previousText = notepad_Text.text
        text_length = previousText.characters.count //텍스트필드 내 글자 수를 text_Maxlength에 입력
        textLength_Check.text = "\(text_length)/\(text_Limit)"      // text_Maxlength / 기존 지정한 text_Limit 을 라벨에 출력
        }

    func button_Alram(title:String, message:String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

class ViewController: UIViewController{
    
    @IBOutlet weak var notepad_Text: UITextField!
    @IBOutlet weak var today_Data: UILabel!
    @IBOutlet weak var textLength_Check: UILabel!
    
    @IBAction func unKnow(sender: UIButton) {
        button_Alram("이것은 버튼입니다", message: "아무 동작도 하지 않아요")
    }
  
    let text_Limit = 20
    var text_length:Int!
    var previousText:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        notepad_Text.delegate = self
        Date()
        notepad_Text.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged) //textFieldDidChange 호출


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}









