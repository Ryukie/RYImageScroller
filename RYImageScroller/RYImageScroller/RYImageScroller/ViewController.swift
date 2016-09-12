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
        v_one.imagesURLs = [
            "http://quncao-app.b0.upaiyun.com/81e6076557197e480acb7a6c3945d7d7.jpg",
            "http://quncao-app.b0.upaiyun.com//storage/emulated/0/HuabanV2/1469770828438.png.jpg",
            "http://quncao-app.b0.upaiyun.com/81e6076557197e480acb7a6c3945d7d7.jpg",
            "http://quncao-app.b0.upaiyun.com//storage/emulated/0/HuabanV2/1469770828438.png.jpg",
            "http://quncao-app.b0.upaiyun.com/81e6076557197e480acb7a6c3945d7d7.jpg",
            "http://quncao-app.b0.upaiyun.com//storage/emulated/0/HuabanV2/1469770828438.png.jpg",
            "http://quncao-app.b0.upaiyun.com/81e6076557197e480acb7a6c3945d7d7.jpg",
            "http://quncao-app.b0.upaiyun.com//storage/emulated/0/HuabanV2/1469770828438.png.jpg"
        ]
        view.addSubview(v_one)

        v_one.handler_cellClick = { (index)  -> () in
            print("点击了\(index)")
        }
        
    }

}

