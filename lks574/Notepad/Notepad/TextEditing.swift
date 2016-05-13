//
//  TextEditing.swift
//  Notepad
//
//  Created by lks on 2016. 5. 13..
//  Copyright © 2016년 SwiftBook. All rights reserved.


import UIKit

extension ViewController: UITextFieldDelegate {

    func textField(notepad: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        notepad.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)      //notepad가 바뀔 때 마다 textFieldDidChange를 실행해라

//        if (notepad.text!.characters.count <= max){           //아래에서 글자를 지워 버려서 사용하지 않아도 된다.
//           return true      // max보다 작으면 글자가 적힌다.
//        }else{
//            return false    //크다면 글자가 적히지 않는다.
//        }
        return true
        
    }
    func textFieldDidChange(textField: UITextField){

        if (notepad.text!.characters.count >= 21){       //21번쨰 글자가 찍히는 순간
            
            if(cutTextCount == 20){             // 전에 20번째 였다면 원래 입력 되있는 것을 출력한다.
                notepad.text! = cutTextString
            }

            let textrange = notepad.text!.startIndex.advancedBy(20)..<notepad.text!.endIndex     //20글자 남기고 뒤쪽이 textrange로 범위 지정
            notepad.text!.removeRange(textrange)        //textrange를 지운다.
            
        }
        cutTextCount = notepad.text!.characters.count        //자르고 난 뒤의 characters의 수
        cutTextString = notepad.text!        //자르고 난 뒤 string을 저장
        textCheckLable.text! = "\(notepad.text!.characters.count)/\(maxText)"               //현재 써져 있는 수와 최대치를 보여준다.
    }
}
