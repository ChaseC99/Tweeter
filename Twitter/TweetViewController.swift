//
//  TweetViewController.swift
//  Twitter
//
//  Created by Chase Carnaroli on 2/11/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTextField.becomeFirstResponder()
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTweet(_ sender: Any) {
        if (!tweetTextField.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextField.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet: \(error)")
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
