//
//  TwitterClient.swift
//  Twitter
//
//  Created by Chase Lee on 2/16/16.
//  Copyright © 2016 Chase Lee. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "qjLpASQR6eeU6qdo1BBOF5CoR"
let twitterConsumerSecret = "g733t9tzTxwLfsbJHYkTQsWhZca9j15nlxYDyFBO6kObcJCX5g"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")


class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }

}
