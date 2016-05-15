//
//  ViewController.swift
//  Notepad
//
//  Created by lks on 2016. 5. 10..
//  Copyright © 2016년 SwiftBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textCheckLable: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var notepad: UITextField!
    @IBAction func saveButton(sender: AnyObject) {
        
    }
    
    let maxText:Int = 20        //최대 글자 수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        today()         //시작하면서 날짜를 띄우기 위해
        notepad.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {      //터치 할때마다 키보드 내리기
        self.view.endEditing(true)
    }
    
    func textFieldDidChange(textField: UITextField){
        var cutTextCount = 0            ////가운데 커서 이동하고 클릭해서 글자를 추가하는 것을 막기위해 변수 사용
        var cutTextString = ""
        
        guard var optionalBindingText = notepad.text        //옵셔널 바인딩(옵셔널 풀어주기)
            else{
                return
        }
        
        if (optionalBindingText.characters.count > maxText){       //21번쨰 글자가 찍히는 순간
            
            if(cutTextCount == maxText){             // 전에 20번째 였다면 원래 입력 되있는 것을 출력한다.
                optionalBindingText = cutTextString
            }
            
            let textrange = optionalBindingText.startIndex.advancedBy(maxText)..<optionalBindingText.endIndex     //20글자 남기고 뒤쪽이 textrange로 범위 지정
            optionalBindingText.removeRange(textrange)        //textrange를 지운다.
            notepad.text! = optionalBindingText
            
        }
        cutTextCount = optionalBindingText.characters.count        //자르고 난 뒤의 characters의 수
        cutTextString = optionalBindingText        //자르고 난 뒤 string을 저장
        textCheckLable.text! = "\(optionalBindingText.characters.count)/\(maxText)"               //현재 써져 있는 수와 최대치를 보여준다.
    }
}