//
//  TweetCell.swift
//  Twitter
//
//  Created by Chase Carnaroli on 2/5/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var rtButton: UIButton!
    
    var tweetId = 0
    var favorited = false
    var retweeted = false
    
    @IBAction func favTweet(_ sender: Any) {
        let toBeFav = !favorited
        if (toBeFav) {
            TwitterAPICaller.client?.favTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: {(error) in
                    print("Fav did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unFavTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: {(error) in
                print("Unfav did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweet(true)
            }, failure: {(error) in
                print("Error in retweeting: \(error.localizedDescription)")
        })
    }
    
    func setFavorite(_ isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweet(_ isRetweeted: Bool){
        if (isRetweeted) {
            rtButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        } else {
            rtButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
