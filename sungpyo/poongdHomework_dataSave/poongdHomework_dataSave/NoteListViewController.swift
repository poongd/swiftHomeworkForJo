//
//  NoteListViewController.swift
//  poongdHomework_dataSave
//
//  Created by jsp on 2016. 6. 1..
//  Copyright © 2016년 jsp. All rights reserved.
//

import UIKit

class NoteListViewController: UITableViewController {

//    let Context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
