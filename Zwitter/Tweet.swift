//
//  Tweet.swift
//  Zwitter
//
//  Created by zeus medina on 2/19/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: NSString?
    var user: User?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favorites_count: Int = 0
    var tweetID: NSString?
    var isFavorited: Bool?
    var isRetweeted: Bool?
    
 
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favorites_count = (dictionary["favorite_count"] as? Int) ?? 0
        tweetID = dictionary["id_str"] as? String
        
        let timeStampString = dictionary["created_at"] as? String
        let formatter = NSDateFormatter()
        
        if let timeStampString = timeStampString {
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timeStampString)
        }
        
        isFavorited = dictionary["favorited"] as? Bool
        isRetweeted = dictionary["retweeted"] as? Bool
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }
}
