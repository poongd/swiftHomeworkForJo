//
//  TextField.swift
//  poongdHomework_notepad
//
//  Created by jsp on 2016. 5. 13..
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
    
    func textField(textUI: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String)->Bool{
        textUI.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged) //textFieldDidChange 호출
        return true // 입력가능한 true
    }
    
    func textFieldDidChange(textField: UITextField) {
        if (noptead_Text.text!.characters.count > text_Limit) { //텍스트필드 내 글자수가 보다 크거나 같을경우.
            
            if text_Maxlength == text_Limit{ // 텍스트 길이가 text_Limit 에 도달했을경우 입력안되게 처리.
                noptead_Text.text! = exceptionString
            }
            
            let Text_removeRange = noptead_Text.text!.startIndex.advancedBy(text_Limit)..<noptead_Text.text!.endIndex //텍스트필드의 시작지점의 5번째부터~끝까지 Text_removeRange에 입력.
            noptead_Text.text!.removeRange(Text_removeRange) // 텍스트필드에 저장되어있는 글자중 Text_removeRange의 문자를 삭제.
        }
        exceptionString = noptead_Text.text!
        text_Maxlength = noptead_Text.text!.characters.count  //텍스트필드 내 글자 수를 text_Maxlength에 입력
        textLength_Check.text! = "\(text_Maxlength)/\(text_Limit)"      // text_Maxlength / 기존 지정한 text_Limit 을 라벨에 출력
    }
    
}