//
//  TweetCell.swift
//  Zwitter
//
//  Created by zeus medina on 2/20/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileHandle: UILabel!
    @IBOutlet weak var tweetDateAndTime: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    @IBOutlet weak var rtLabel: UILabel!
    @IBOutlet weak var favLabel: UILabel!
    
    
    
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
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
