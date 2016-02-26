//
//  TweetDetailViewController.swift
//  Zwitter
//
//  Created by zeus medina on 2/23/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileHandle: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    @IBOutlet weak var tweetDateAndTime: UILabel!
    @IBOutlet weak var rtLabel: UILabel!
    @IBOutlet weak var favLabel: UILabel!
    
    var tweet: Tweet!
    
    var favoriteStatus: Bool?
    var retweetStatus: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
        // Do any additional setup after loading the view.
    }
    
    
    func setContent() {
        profilePicture.setImageWithURL((tweet.user?.profileUrl)!)
        profileName.text = tweet.user?.name
        let handle = (tweet.user?.screenName)!
        profileHandle.text = "@\(handle)"
        userTweet.text = String(tweet.text!)
        tweetDateAndTime.text = String(tweet.timestamp!)
        favLabel.text = String(tweet.favorites_count)
        rtLabel.text = String(tweet.retweetCount)

        retweetStatus = tweet.isRetweeted
        favoriteStatus = tweet.isFavorited
        
    }
    
    //TODO: Make retweet status and count consistent across views
    @IBAction func detailRetweet(sender: AnyObject) {
        
    }
    //TODO: Make favorite status and count consisten across views
    @IBAction func detailFavorite(sender: AnyObject) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
