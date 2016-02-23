//
//  User.swift
//  Twitter
//
//  Created by Chase Lee on 2/21/16.
//  Copyright © 2016 Chase Lee. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name:String?
    var screenname: String?
    var profileUrl: String?
    var tagline: NSString?
    var imageURL: NSURL?
    
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        
        
        let profileUrl = dictionary["profile_image_url"] as? String
        if let profileUrl = profileUrl {
            imageURL = NSURL(string: profileUrl)
        }

            
        tagline = dictionary["description"] as? String
        
        
    }
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil{
                let defaults = NSUserDefaults.standardUserDefaults()
                
                let userData = defaults.objectForKey("currentUserData") as? NSData
                
                if let userData = userData {
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            
            return _currentUser
        }
        set(user) {
            _currentUser = user
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            
            defaults.synchronize()
            
        }
    }
 
}



