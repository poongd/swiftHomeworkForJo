//
//  Today.swift
//  Notepad
//
//  Created by lks on 2016. 5. 13..
//  Copyright © 2016년 SwiftBook. All rights reserved.
//

import UIKit

extension ViewController{
    
    func today(){       //날짜 입력
        let format = NSDateFormatter()          //날짜 포맷
        format.dateFormat = "yyyy/MM/dd (E)"        //현재 날짜의 출력형태
        format.locale = NSLocale(localeIdentifier: "ko_kr")     //지역을 한국으로 설정
        dateLabel.text! = format.stringFromDate(NSDate())
    }
    
}