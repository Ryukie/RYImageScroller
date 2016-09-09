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
    
    var currentIndex = 0
    
    let cellID = "imageCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imagesURLs = [
            "kuma01",
            "kuma01",
            "kuma01",
            "kuma01",
            "kuma01",
            "kuma01",
            "kuma01",
            "kuma01"
        ]
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor.red
        addSubview(cv_imageScroller)
        
        //先滚到中间的第一个
        if imagesURLs.count > 0 {
            cv_imageScroller.scrollToItem(at: IndexPath(item: 0, section: 1), at: .left, animated: false)
        }
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

//MARK: - Closure
    var handler_cellClick :((_ index : NSInteger) -> Void)?
    
}

//MARK: - collectionDelegateDataSource
extension RYImageScroller:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! RYImageCell
        cell.imageURL = imagesURLs[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (handler_cellClick != nil) {
            handler_cellClick!(currentIndex)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollIndexFix()
    }
    
    func scrollIndexFix() {
        let index = NSInteger(cv_imageScroller.contentOffset.x / self.frame.width)
        let indexMid = index % imagesURLs.count
        currentIndex = indexMid
        cv_imageScroller.scrollToItem(at: IndexPath(item: indexMid, section: 1), at: .left, animated: false)
        print(indexMid)
    }
    
}
