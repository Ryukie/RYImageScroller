//
//  RYImageCell.swift
//  RYImageScroller
//
//  Created by RongqingWang on 16/9/7.
//  Copyright © 2016年 RongqingWang. All rights reserved.
//

import UIKit

class RYImageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI () {
        backgroundColor = UIColor.lightGray
        contentView.addSubview(lb_title)
    }
    
//MARK: - lazyInit
    lazy var lb_title : UILabel = {
        var lb = UILabel()
        lb.textColor = UIColor.black
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return lb
    }()
    
}
