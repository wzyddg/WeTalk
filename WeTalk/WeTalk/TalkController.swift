//
//  TalkController.swift
//  WeTalk
//
//  Created by 王泽宇 on 16/6/1.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit
import Alamofire

class TalkController: UIViewController, UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    var talkHistoryKey = "1TalkHistory"
    var historyArray : NSMutableArray?

    var talkID:String = ""
    {
        didSet {
            talkHistoryKey = talkID + "TalkHistory"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        
        // Uncomment the following line to preservedo selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    @IBAction func sendClicked(sender: UIButton) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var history = NSUserDefaults.standardUserDefaults().objectForKey(talkHistoryKey) as! NSMutableArray
        
        return history.count/2
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if historyArray == nil {
            historyArray = NSUserDefaults.standardUserDefaults().objectForKey(talkHistoryKey) as? NSMutableArray
        }

        if historyArray![indexPath.row*2] as! String == "1" {
            var cell = tableView.dequeueReusableCellWithIdentifier("ReceiveCell", forIndexPath: indexPath) as! ReceiveCell
            cell.contentLabel.font = UIFont.systemFontOfSize(16)
            cell.contentLabel.text = historyArray![indexPath.row*2+1] as! String
            cell.contentLabel.numberOfLines = 0
            cell.contentLabel.lineBreakMode = .ByTruncatingTail
            let maxSize = CGSizeMake(UIScreen.mainScreen().bounds.width-110 , 20000)
            let realSize = cell.contentLabel.sizeThatFits(maxSize)
            cell.contentLabel.frame = CGRectMake(cell.contentLabel.frame.minX , cell.contentLabel.frame.minY, realSize.width, realSize.height)
            
            cell.boundaryView.frame = CGRectMake(cell.contentLabel.frame.minX , cell.contentLabel.frame.minY, realSize.width, realSize.height)
            
            return cell
        }else{
            var cell = tableView.dequeueReusableCellWithIdentifier("SendCell", forIndexPath: indexPath) as! SendCell
            cell.contentLabel.font = UIFont.systemFontOfSize(16)
            cell.contentLabel.text = historyArray![indexPath.row*2+1] as! String
            cell.contentLabel.numberOfLines = 0
            cell.contentLabel.lineBreakMode = .ByTruncatingTail
            let maxSize = CGSizeMake(UIScreen.mainScreen().bounds.width-110 , 20000)
            let realSize = cell.contentLabel.sizeThatFits(maxSize)
//            cell.contentLabel.frame.size = realSize
            cell.contentLabel.frame = CGRectMake(cell.contentLabel.frame.minX , cell.contentLabel.frame.minY, realSize.width, realSize.height)
            
//            cell.boundaryView.frame.size = CGSizeMake(realSize.width+20, realSize.height+20)
            cell.boundaryView.frame = CGRectMake(cell.contentLabel.frame.minX , cell.contentLabel.frame.minY, realSize.width, realSize.height)
            
            return cell
        }
        
//        if(indexPath.row%2==0){
//            let cell = tableView.dequeueReusableCellWithIdentifier("ReceiveCell", forIndexPath: indexPath) as! ReceiveCell
//            return cell
//        }else{
//            return tableView.dequeueReusableCellWithIdentifier("SendCell", forIndexPath: indexPath) as! SendCell
//        }

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 70
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
