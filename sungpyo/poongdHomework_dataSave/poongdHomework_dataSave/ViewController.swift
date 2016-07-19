//
//  ViewController.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 5. 17..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit
import CoreData

let Context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

var cellArray = [NSManagedObject]()
extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()  // 리턴키 입력(true) 시 키보드 내리기
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true) // 바탕 터치하면 키보드 내리기
    }
    
    func textFieldDidChange(textField: UITextField){
        
        if var unverifiedText = notepad_Text.text where unverifiedText.characters.count > text_Limit{ //텍스트필드 내 글자수가 보다 크거나 같을경우.
            
            if text_length == text_Limit {
                notepad_Text.text = previousText
                
            } else {
                let Text_removeRange = unverifiedText.startIndex.advancedBy(text_Limit)..<unverifiedText.endIndex //텍스트필드의 시작지점의 5번째부터~끝까지 Text_removeRange에 입력.
                unverifiedText.removeRange(Text_removeRange)
            }
        }
        previousText = notepad_Text.text // 현재 텍스트필드의 텍스트를 이전 텍스트를 담는 변수에 입력.
        text_length = previousText.characters.count //텍스트필드 내 글자 수를 text_Maxlength에 입력
        textLength_Check.text = "\(text_length)/\(text_Limit)"      // text_Maxlength / 기존 지정한 text_Limit 을 라벨에 출력
    }
    
    func button_Alram(title:String, message:String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class ViewController: UIViewController{
    
    
    @IBAction func unKnow(sender: UIButton) {
        button_Alram("이것은 버튼입니다", message: "아무 동작도 하지 않아요")
    }
    
    @IBOutlet weak var notepad_Text: UITextField!
    @IBOutlet weak var today_Data: UILabel!
    @IBOutlet weak var textLength_Check: UILabel!
    
    @IBAction func findContact(sender: AnyObject) {
//        let entityDescription = NSEntityDescription.entityForName("Notepad", inManagedObjectContext: Context)
        // 세이브 액션에서 centext 생성한건데 이 함수에서 context를 어떻게 쓸수있는지 이해안감..
        
        let request = NSFetchRequest(entityName: "Notepad") // NSFetchRequest를 통해 Notepad 엔티티 불러옴.
//        request.entity = entityDescription  // 필요없어보임... 왜썼는지도 의문
        
        do {
            
            let Result = try Context.executeFetchRequest(request) as! [NSManagedObject] // NSManagedObject의 배열을 Result에 담음.
            cellArray = Result
            
            for index in 0..<Result.count { //Result가 NSManagedObject의 배열이므로, ManagedObjectContext 의 갯수만큼 for문으로 반복.
                let managedObj = Result[index] //각 ManagedObjectContext 번호의 배열을 managedObj 에 담음.
                let attr = managedObj.entity.attributesByName // 딕셔너리 구조로 변경 후 attr에 담음.
                let allKeys = Array(attr.keys) // 이놈 정확히 이해안감1..
                let dics = managedObj.dictionaryWithValuesForKeys(allKeys) //딕셔너리 배열구조로 바꿔서 입력하는거같지만 이놈 정확히 이해안감2..
                print("\(index+1)번 데이터")
                print(dics)
                
                
                
            }
            
        } catch let error as NSError {
            notepad_Text.text = error.localizedFailureReason // 요 에러부분도 어떤 역할을 하는지는 알겠으나 error.localizedFailureReason 이해안감.
            print("error")
        }
        
        do{
            let objects = try Context.executeFetchRequest(request)// as! [NSManagedObject]
            //            if let results = objects {
            if objects.count > 0 {
//                let match = objects[0] as! NSManagedObject
                notepad_Text.text = "저장된 데이터 : \(objects.count)"
            }
            //            }
        }catch let error as NSError  {
            notepad_Text.text = error.localizedFailureReason
            print("???")
        }
    }
    
    @IBAction func saveButton(sender: AnyObject) {  // 세이브 버튼을 눌렀을때.
        
//        let entityDescription = NSEntityDescription.entityForName("Notepad", inManagedObjectContext: Context)
        /*NSEntityDescription.entityForName 을 통해서 "Notepad"엔티티 안에 새로운 NSManagedObjectContext 생성*/
//        let contact = Notepad(entity: entityDescription!, insertIntoManagedObjectContext: Context)
        /* contact는 Notepad 클래스 이며 Context 라는 새로운 ManagedObjectContext 생성. */
        
        let contact = NSEntityDescription.insertNewObjectForEntityForName("Notepad", inManagedObjectContext: Context) as! Notepad
        // 한줄 변경시 다음과 같이 가능하다고 함.
        // NSEntityDescription 의 멤버 함수인 insertNewObjectForEntityForName 이놈을 이용하여 Context 라는 ManagedObjectContext 를 만들고
        // 그걸 Notepad 라는 엔티티로 형변환 후 contact에 입력.
        
        contact.text = notepad_Text.text // Notepad의 코어데이터속성인 text에 현재 텍스트필드 텍스트 내용을 넣음.
        contact.date = date("yyyy년 MM월 dd일(E) HH시 mm 분 ss초") //해당 날짜 형식으로 date함수를 호출
        date("yyyy년 MM월 dd일(E)") // 앱 시작화면의 날짜형식이 위와같이 바뀌면 안되므로 해당 형식으로 date함수 재 호출.
        
        do{
            try Context.save() // NSManagedObjectContext 내용을 세이브.
            
            print("저장이 완료되었습니다.")
            print("저장된 텍스트 : \(notepad_Text.text!)\n저장된 시간 : \(contact.date!)")
            notepad_Text.text = "" // 현재 텍스트 필드의 내용을 공백으로 초기화.
            
        }catch let error as NSError  { // 에러 발생시
            notepad_Text.text = error.localizedFailureReason
            print("저장이 실패하였습니다.")
        }
    }

    // 여기부터 클래스변수.
    
    
    /*코어 데이터를 이용하여 데이터를 저장하고 가져오기 위해서는 애플리케이션 델리게이트의 매니지드 객체 콘텍스트에 대한 참조체가 필요하다. */
    
    let text_Limit = 20 // 글자수 20자로 제한
    var text_length = 0 // 입력한 텍스트의 길이를 저장하기 위한 변수.
    var previousText:String! // 변경되기 전 텍스트를 저장하기 위한 변수.
    
    func fa(){
        let request = NSFetchRequest(entityName: "Notepad")
        do {
            try Context.executeFetchRequest(request) as! [NSManagedObject]
            
        }catch let error as NSError {
            notepad_Text.text = error.localizedFailureReason // 요 에러부분도 어떤 역할을 하는지는 알겠으나 error.localizedFailureReason 이해안감.
            print("error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fa();
        notepad_Text.delegate = self
        date("yyyy년 MM월 dd일(E)") //날짜 형식을 지정하고 앱 실행시 지정한 날짜 형식으로 화면에 출력.
        notepad_Text.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged) //앱 시작시 textFieldDidChange 호출
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

/* 쓰잘때 없는것들 치웁시다. */



//    @IBAction func dateFormat(sender: AnyObject) {
//        let alert2 = UIAlertController(title: "날짜형식입력", message: "날짜형식을 입력해주세요", preferredStyle: UIAlertControllerStyle.Alert)
//        let saveAction = UIAlertAction(title: "입력완료", style: .Default)    {(action : UIAlertAction) -> Void in
//            let firstText = alert2.textFields![0]
//            self.addDate(firstText.text!)
//        }
//
//        let cancelAction = UIAlertAction(title: "입력취소", style: .Default) {(action : UIAlertAction) -> Void in
//        }
//
//        alert2.addTextFieldWithConfigurationHandler{(textField:UITextField) -> Void in
//        }
//
//        alert2.addAction(saveAction)
//        alert2.addAction(cancelAction)
//
//        self.presentViewController(alert2, animated: true, completion: nil)
//    }
//
//    func addDate(date2 : String) {
//        date(date2)
//    }
//


