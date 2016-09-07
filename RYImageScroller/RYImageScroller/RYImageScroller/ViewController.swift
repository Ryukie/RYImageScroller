//
//  ViewController.swift
//  RYImageScroller
//
//  Created by RongqingWang on 16/9/7.
//  Copyright © 2016年 RongqingWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setUpUI () {
        view.backgroundColor = UIColor.blue
        let v_one = RYImageScroller(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
        view.addSubview(v_one)
    }

}

