//
//  RYImageScroller.swift
//  RYImageScroller
//
//  Created by RongqingWang on 16/9/7.
//  Copyright © 2016年 RongqingWang. All rights reserved.
//

import UIKit

class RYImageScroller: UIView {
    /**
     *  需要展示的图片数组
     */
    var imagesURLs = [String]()
    let cellID = "imageCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor.red
        addSubview(cv_imageScroller)
    }
    
//MARK: - LazyInit
    lazy var cv_imageScroller : UICollectionView = {
        let cv = UICollectionView(frame: CGRect(x:0,y:0,width:self.frame.width,height:self.frame.height), collectionViewLayout: self.layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(RYImageCell.self, forCellWithReuseIdentifier: self.cellID)
        cv.isPagingEnabled = true
        return cv
    }()
    private lazy var layout : UICollectionViewFlowLayout  = {
        let layoutT = UICollectionViewFlowLayout()
        layoutT.minimumLineSpacing = 0
        layoutT.minimumInteritemSpacing = 0
        layoutT.itemSize = self.frame.size
        layoutT.scrollDirection = .horizontal
        return layoutT
    }()
    
}

//MARK: - collectionDelegateDataSource
extension RYImageScroller:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! RYImageCell
        cell.lb_title.text = "第\(indexPath.row)个"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
    
}
