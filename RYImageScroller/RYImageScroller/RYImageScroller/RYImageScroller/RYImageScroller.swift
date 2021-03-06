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
    var imagesURLs = [String]() {
        didSet {
            cv_imageScroller.reloadData()
            //直接滚到中间的第一张
            if imagesURLs.count > 0 {
                cv_imageScroller.scrollToItem(at: IndexPath(item: 0, section: 1), at: .left, animated: false)
            }
        }
    }
    
    var placeholderImageName : String?
    
    var currentIndex = 0
    
    weak var timer : Timer?
    
    let cellID = "imageCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - Function
    private func setupUI() {
        backgroundColor = UIColor.red
        addSubview(cv_imageScroller)
    }
    
    func setUpTimer () {
        let timerT = Timer(timeInterval: 2.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        timer = timerT
        RunLoop.current.add(timerT, forMode: .commonModes)
    }
    
    func invalidateTimer () {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func countDown () {
        currentIndex += 1
        if currentIndex >= imagesURLs.count {
            cv_imageScroller.scrollToItem(at: IndexPath(item: 0, section: 2), at: .left, animated: true)
            return
        } else {
        }
        cv_imageScroller.scrollToItem(at: IndexPath(item: currentIndex, section: 1), at: .left, animated: true)
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
    var cb_scrollEndCallBack : ((_ index : NSInteger) -> Void)?
    
}

//MARK: - collectionDelegateDataSource
extension RYImageScroller:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! RYImageCell
        cell.imageURL = imagesURLs[indexPath.row]
        cell.placeholderImageName = placeholderImageName
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
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print(#function)
        if currentIndex == imagesURLs.count {
            cv_imageScroller.scrollToItem(at: IndexPath(item: 0, section: 1), at: .left, animated: false)
            currentIndex = 0;
        }
        scrollIndexFix()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        invalidateTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        invalidateTimer()
        setUpTimer()
    }
    
    func scrollIndexFix() {
        let index = NSInteger(cv_imageScroller.contentOffset.x / self.frame.width)
        let indexMid = index % imagesURLs.count
        currentIndex = indexMid
        cv_imageScroller.scrollToItem(at: IndexPath(item: indexMid, section: 1), at: .left, animated: false)
        print(indexMid)
    }
    
}
