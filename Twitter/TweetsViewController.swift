//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Chase Lee on 2/22/16.
//  Copyright © 2016 Chase Lee. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "bird_blue"))
        
        tableview.dataSource = self
        tableview.delegate = self
        //tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 300
    
    
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableview.reloadData()
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
        })
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            if tweets != nil{
                return (tweets?.count)!
            } else {
                return 0
            }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        cell.tweet = self.tweets?[indexPath.row]
        
        return cell
    }
    
    

    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    }
    */


