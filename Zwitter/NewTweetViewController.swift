//
//  NewTweetViewController.swift
//  Zwitter
//
//  Created by zeus medina on 2/26/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController {

    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var newTweetTextField: UITextField!
    @IBOutlet weak var numberChar: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tweetIsBeingTyped(sender: AnyObject) {
        let temp = newTweetTextField.text
        let count = temp?.characters.count
        
        numberChar.text = "\(140 - count!)"
        
        if(Int(numberChar.text!)! <= 0) {
            newTweetTextField.text = String(newTweetTextField.text!.characters.dropLast())
        }
    }

    @IBAction func onSend(sender: AnyObject) {
        if(newTweetTextField.text != nil) {
            let tweetContent = newTweetTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
            TwitterClient.sharedInstance.sendTweet(tweetContent)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
