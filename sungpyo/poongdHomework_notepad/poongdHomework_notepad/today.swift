//
//  UITextField.swift
//  poongdHomework_notepad
//
//  Created by jsp on 2016. 5. 13..
//  Copyright © 2016년 jsp. All rights reserved.
//

import Foundation

extension ViewController{
    
        func today (){
            let formatDate = NSDateFormatter()
            formatDate.dateFormat = "yyyy/MM/dd (E)" // 년/월/일/요일 순
            formatDate.locale = NSLocale(localeIdentifier: "ko_kr")  // 한국기준
            let today = formatDate.stringFromDate(NSDate()) // 날짜를 받아와서 today 함수에 입력
            today_Data.text! = today
    }
    
}
