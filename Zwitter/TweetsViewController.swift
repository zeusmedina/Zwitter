//
//  TweetsViewController.swift
//  Zwitter
//
//  Created by zeus medina on 2/19/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TweetCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var tweets: [Tweet]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource  = self
        self.tableView.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            for tweet in tweets {
                print(tweet.text)
            }
            self.tweets = tweets
            self.tableView.reloadData()
            }) { (error: NSError) -> () in
                
                
        }
     

        // Do any additional setup after loading the view.
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that c  n be recreated.
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tweets != nil {
            return (self.tweets?.count)!
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        
        if (tweets != nil) {
            cell.tweet = tweets![indexPath.row]
        }
        //cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.delegate = self
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    func tweetCellUserProfileImageTapped(cell: TweetCell, forTwitterUser user: User?) {
        
        print(user)
        print("Something else")
        if let profileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileViewController") as? ProfileViewController {
            // get the user from the cell here and assign it to `user` object in `profileViewController`
            profileViewController.user = user
            
            // push the `profileViewController` at the top of nav controller
            navigationController?.pushViewController(profileViewController, animated: true)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "NewTweetSegue") {
            //let destination = segue.destinationViewController as? NewTweetViewController
            
        }/*else if(segue.identifier == "ProfileViewSegue") {
            print("Profile view seg")
        }*/ 
        else if (segue.identifier == "DetailViewSegue") {
            let cell = sender as! TweetCell
            let indexPath = tableView.indexPathForCell(cell)
            
            let tweet = tweets![indexPath!.row]
                
            
            let detailViewController = segue.destinationViewController as! TweetDetailViewController
        
            detailViewController.tweet = tweet
        
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
