//
//  TalkController.swift
//  WeTalk
//
//  Created by 王泽宇 on 16/6/1.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit

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
        textField.delegate = self
        historyArray = NSUserDefaults.standardUserDefaults().objectForKey(talkHistoryKey) as? NSMutableArray
        
        // Uncomment the following line to preservedo selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    @IBAction func sendClicked(sender: UIButton) {
        let stringForSend = textField.text
        if isEmptyString(stringForSend!) {
            return
        }
        historyArray = NSUserDefaults.standardUserDefaults().objectForKey(talkHistoryKey) as? NSMutableArray
        historyArray = NSMutableArray(array: historyArray!)
        historyArray!.addObject("2")
        historyArray!.addObject(stringForSend!)
        NSUserDefaults.standardUserDefaults().setObject(historyArray, forKey: talkHistoryKey)
        historyArray = NSUserDefaults.standardUserDefaults().objectForKey(talkHistoryKey) as? NSMutableArray
        tableView.reloadData()
        
        textField.text = ""
        
        getMessage("reply to:"+stringForSend!)
    }
    
    func getMessage(str:String) -> Void {
        historyArray = NSUserDefaults.standardUserDefaults().objectForKey(talkHistoryKey) as? NSMutableArray
        historyArray = NSMutableArray(array: historyArray!)
        historyArray?.addObject("1")
        historyArray?.addObject(str)
        NSUserDefaults.standardUserDefaults().setObject(historyArray, forKey: talkHistoryKey)
        historyArray = NSUserDefaults.standardUserDefaults().objectForKey(talkHistoryKey) as? NSMutableArray
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isEmptyString(str: String) -> Bool{
        for c in str.characters {
            if c != "\n" {
                return false
            }
        }
        return true
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return historyArray!.count/2
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if historyArray![indexPath.row*2] as! String == "1" {
            let cell = tableView.dequeueReusableCellWithIdentifier("ReceiveCell", forIndexPath: indexPath) as! ReceiveCell
            cell.contentLabel.text = historyArray![indexPath.row*2+1] as? String
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("SendCell", forIndexPath: indexPath) as! SendCell
            cell.contentLabel.text = historyArray![indexPath.row*2+1] as? String
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tmp = UILabel()
        tmp.numberOfLines = 0
        tmp.text = historyArray![indexPath.row*2+1] as? String
        tmp.lineBreakMode = .ByWordWrapping
        tmp.font = UIFont.systemFontOfSize(16)
        let maxSize = CGSize(width: UIScreen.mainScreen().bounds.width-105, height: 2000)
        let actualSize = tmp.sizeThatFits(maxSize)
        return max(actualSize.height+20, 45)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.becomeFirstResponder()
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
