//
//  ViewController.swift
//  LineShare
//
//  Created by Steve Lai on 2020/5/28.
//  Copyright © 2020 plusForm. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstFrame = CGRect(x: 0, y: 0, width: 100, height: 150)
                let label = UILabel(frame: firstFrame)
                label.text = "Hello World!"
                label.backgroundColor = UIColor.blue
                view.addSubview(label)
                
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
                gradientLayer.frame = view.bounds
        //        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
                view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func pressShareButton(_ sender: UIButton) {
        let message: String! = "測試訊息！"
        
        // 將訊息編碼成 UTF-8 格式
        let encodeMessage = message.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        let lineURL = URL(string: "line://msg/text/" + encodeMessage!) // 分享訊息的 URL Scheme
        
        UIApplication.shared.open(lineURL!) { (result) in
            if result {
               // The URL was delivered successfully!
            }else{
                let lineURL = URL(string: "itms-apps://itunes.apple.com/app/id443904275")!
                UIApplication.shared.open(lineURL, options: [:], completionHandler: nil)
            }
        }
    }


}

