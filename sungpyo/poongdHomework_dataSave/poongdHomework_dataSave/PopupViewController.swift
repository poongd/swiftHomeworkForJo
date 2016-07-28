//
//  PopupViewController.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 7. 27..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit
import CoreData


class PopupViewController: UIViewController {
    
    @IBOutlet weak var popUpTextV: UITextView!
    var Cellrow:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        let CellValue:String = (cellArray[Cellrow].valueForKey("text") as? String)!
        
        TextView(CellValue)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func closePopUp(sender: AnyObject){
        self.view.removeFromSuperview()
    }
    
    func TextView(text: String){
        popUpTextV.text = text
        
    }

    @IBAction func SaveBtn(sender: AnyObject){
        let contact = NSEntityDescription.insertNewObjectForEntityForName("Notepad", inManagedObjectContext: Context) as! Notepad
        contact.text = "11"
        do{
            try Context.save()
            print("수정완료")
        }catch let error as NSError  { // 에러 발생시
            popUpTextV.text = error.localizedFailureReason
            print("수정실패.")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
