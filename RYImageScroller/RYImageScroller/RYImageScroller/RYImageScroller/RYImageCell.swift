//
//  RYImageCell.swift
//  RYImageScroller
//
//  Created by RongqingWang on 16/9/7.
//  Copyright © 2016年 RongqingWang. All rights reserved.
//

import UIKit

class RYImageCell: UICollectionViewCell {
    
    var imageURL : String? {
        didSet {
            iv_image.image = UIImage.init(named: imageURL!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI () {
        backgroundColor = UIColor.lightGray
        
        contentView.addSubview(iv_image)
        
        iv_image.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.width)
        
    }
    
//MARK: - lazyInit
    lazy var iv_image : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()

}
