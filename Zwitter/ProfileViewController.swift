//
//  ProfileViewController.swift
//  Zwitter
//
//  Created by zeus medina on 2/26/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileHandle: UILabel!
    @IBOutlet weak var numTweetsLabel: UILabel!
    @IBOutlet weak var numFollowersLabel: UILabel!
    @IBOutlet weak var numFollowingLabel: UILabel!
    
    
    var user: User!

    func setContent() {
        profileName.text = user.name
        profilePicture.setImageWithURL(user.profileUrl!)
        headerImage.setImageWithURL(user.profileBackgroundUrl!)
        profileHandle.text = user.screenName
        numTweetsLabel.text = String(user.numTweetsLabel!)
        numFollowingLabel.text = String(user.numFollowingLabel!)
        numFollowersLabel.text = String(user.numFollowersLabel!)
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContent()
        
        // Do any additional setup after loading the view.
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
