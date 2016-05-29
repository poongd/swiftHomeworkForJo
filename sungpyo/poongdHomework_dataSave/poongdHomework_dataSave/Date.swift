//
//  date.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 5. 17..
//  Copyright © 2016년 jsp. All rights reserved.
//
import Foundation

extension ViewController{
    
    func date (Date:String) -> String{
        let formatDate = NSDateFormatter()
        formatDate.dateFormat = Date // 년/월/일/요일 순
        formatDate.locale = NSLocale(localeIdentifier: "ko_kr")  // 한국기준
        let today = formatDate.stringFromDate(NSDate()) // 날짜를 받아와서 today 함수에 입력
        today_Data.text! = today
        return today
    }
    
}
