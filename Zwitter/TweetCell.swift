//
//  TweetCell.swift
//  Zwitter
//
//  Created by zeus medina on 2/20/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

protocol profilePictureTappedDelegate {
    func userDidTapProfilePicture(tweet: Tweet)
}

class TweetCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileHandle: UILabel!
    @IBOutlet weak var tweetDateAndTime: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    @IBOutlet weak var rtLabel: UILabel!
    @IBOutlet weak var favLabel: UILabel!
    
    
    var favoriteStatus: Bool?
    var retweetStatus: Bool?
    
    
    
    //userProfileImageView.addGestureRecognizer(tapGestureRecognizer)
    var tweet: Tweet! {
        didSet {
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
    }
    
    
    @IBAction func onRetweetButton(sender: AnyObject) {
        if retweetStatus == true {
            retweetStatus = false
            tweet.isRetweeted = false
            self.tweet.retweetCount--
            rtLabel.text = String(tweet.retweetCount)
            
        } else {
            retweetStatus = true
            tweet.isRetweeted = true
            self.tweet.retweetCount++
            rtLabel.text = String(tweet.retweetCount)
        }
        TwitterClient.sharedInstance.retweet(tweet.tweetID as! String)
        //print(tweet.tweetID)
        //print(tweet.text)
        
    }
   
    
    @IBAction func onFavButton(sender: AnyObject) {
        if favoriteStatus == true {
            favoriteStatus = false
            tweet.isFavorited = false
            self.tweet.favorites_count--
            favLabel.text = String(tweet.favorites_count)
            
        } else {
            favoriteStatus = true
            self.tweet.favorites_count++
            tweet.isFavorited = true
            favLabel.text = String(tweet.favorites_count)
        }
         TwitterClient.sharedInstance.favorite(tweet.tweetID as! String)

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileName.preferredMaxLayoutWidth = profileName.frame.size.width
        profileHandle.preferredMaxLayoutWidth = profileHandle.frame.size.width
        
        /*
        //Create Tap Gesture Recognizer for profile image
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: "profileImageTapped")
        profilePicture.addGestureRecognizer(tapGestureRecognizer)
        */
    }
    
    @IBAction func profileImageButtonTapped(sender: AnyObject) {
        print("Picture tapped")
        
    }
    
    /*
    func profileImageTapped() {
        print("Picture tapped")
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileName.preferredMaxLayoutWidth = profileName.frame.size.width
        profileHandle.preferredMaxLayoutWidth = profileHandle.frame.size.width
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
