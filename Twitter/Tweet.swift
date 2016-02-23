//
//  Tweet.swift
//  Twitter
//
//  Created by Chase Lee on 2/21/16.
//  Copyright © 2016 Chase Lee. All rights reserved.
//

import UIKit
import Foundation

class Tweet: NSObject {
    var text: String?
    var timeAgo: String?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    var createdAt: NSDate?
    var createdAtString: String?
    var user: User?
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = (dictionary["text"] as? String)!
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAtString = dictionary["created_at"] as? String
        createdAt = formatter.dateFromString(createdAtString!)
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoriteCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        }
    }

    func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        return tweets
    }

