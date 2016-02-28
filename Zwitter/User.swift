//
//  User.swift
//  Zwitter
//
//  Created by zeus medina on 2/19/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var screenName: String?
    var profileUrl: NSURL?
    var tagline: String?
    
    var dictionary: NSDictionary?
    var profileBackgroundString: String?
    var profileBackgroundUrl: NSURL?
    
    var numTweetsLabel: Int?
    var numFollowersLabel: Int?
    var numFollowingLabel: Int?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
    
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        
        
        tagline = dictionary["description"] as? String
        
        profileBackgroundString = dictionary["profile_background_image_url"] as? String
        if let profileBackgroundString = profileBackgroundString {
            profileBackgroundUrl = NSURL(string: profileBackgroundString)
        } else {
            
            // a default unsplash photo
            profileBackgroundUrl = NSURL(string: "https://images.unsplash.com/photo-1427835569204-a54780340cb5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&s=004e391f8d744a509a9100f69ee96792")
        }
        
        numFollowersLabel = dictionary["followers_count"] as? Int
        numFollowingLabel = dictionary["friends_count"] as? Int
        numTweetsLabel = dictionary["statuses_count"] as? Int
        

    }
    static let userDidLogoutNotification = "UserDidLogout"
    static var _currentUser: User?
    
    class var currentUser: User? {
        
        set(user) {
            _currentUser = user
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUserData")
            } else  {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            
            defaults.synchronize()
        }
        
        get {
            if _currentUser == nil {
                let defaults = NSUserDefaults.standardUserDefaults()
                
                let userData = defaults.objectForKey("currentUserData") as? NSData
                
                if let userData = userData {
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        
        
    }
    
    
}
