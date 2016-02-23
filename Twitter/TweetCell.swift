//
//  TweetCell.swift
//  Twitter
//
//  Created by Chase Lee on 2/22/16.
//  Copyright © 2016 Chase Lee. All rights reserved.
//

import UIKit


class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet! {
        didSet{
            nameLabel.text = tweet.user!.name
            handleLabel.text = "@\((tweet.user?.screenname)!)"
            tweetTextLabel.text = tweet.text
            timeLabel.text = ".\((tweet?.createdAt)!)"
            profileImageView.setImageWithURL((tweet.user?.imageURL)!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
