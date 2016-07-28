//
//  NoteListViewController.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 6. 1..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit

class NoteListViewController: UITableViewController {
    
    @IBAction func backBtn(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NoteListCell
        
            let managedObj = cellArray[indexPath.row] //각 ManagedObjectContext 번호의 배열을 managedObj 에 담음.
            
            cell.cell_text.text = managedObj.valueForKey("text") as? String
            cell.cell_date.text = managedObj.valueForKey("date") as? String
        
        return cell
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) { //세그만들어서 출력.
//        if segue.identifier == "segue_detail" {
//        
//        let cell = sender as! NoteListCell
//        let path = self.listView.indexPathForCell(cell)
//        
//        let param = cellArray[path!.row]
//            
//        let text = param.valueForKey("text") as? String
//        let date = param.valueForKey("date") as? String
//        
//        (segue.destinationViewController as? PopupViewController)?.text = text
//        (segue.destinationViewController as? PopupViewController)?.date = date
//        }
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
       let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("popUpViewID") as! PopupViewController
        popOverVC.Cellrow = indexPath.row
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMoveToParentViewController(self)
        
    }
    
    
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){

        if editingStyle == .Delete {
            
            let delete = cellArray[indexPath.row]
            Context.deleteObject(delete)
            
                do{
                    try Context.save()
                        cellArray.removeAtIndex(indexPath.row)
                }catch{
                    print("삭제 후 저장안됨")
                }
            self.tableView.reloadData()
            
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
       
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
