//
//  ViewController.swift
//  CollectionViewDateTest
//
//  Created by Dustin on 2019/9/25.
//  Copyright © 2019 Dustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate,TitleScrollDelegate,DataScrollDelegate {

    @IBOutlet weak var c_col: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(isDataGet(notification:)), name: NSNotification.Name(rawValue: "tapCellScrollNotification"), object: nil)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let TitleCell:CollectionViewTitleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "title", for: indexPath) as! CollectionViewTitleCell
        let cell:CollectionViewDateCell = collectionView.dequeueReusableCell(withReuseIdentifier: "date", for: indexPath) as! CollectionViewDateCell

        if indexPath.section == 0{
            
            TitleCell.delegate = self
            
            TitleCell.l_date.text = "日期"
            TitleCell.l_morning.text = "早上"
            TitleCell.l_evening.text = "中午"
            TitleCell.l_night.text = "晚上"
                        
            return TitleCell
        }
        else{
            cell.delegate = self

            if indexPath.row == 0{
                cell.l_date.text = "2019-09-11"
                
            }
            
            return cell
        }
    }
    
    func TitleScroll(cell: CollectionViewTitleCell) {
        let indexPath = c_col.indexPath(for: cell)
        
        
    }
    
    func DataScroll(cell: CollectionViewDateCell) {
        let indexPath = c_col.indexPath(for: cell)
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
   
    func synchronizeScrollView(_ scrollViewToScroll: UIScrollView, toScrollView scrolledView: UIScrollView) {
        var offset = scrollViewToScroll.contentOffset
        offset.x = scrolledView.contentOffset.x

        scrollViewToScroll.setContentOffset(offset, animated: true)
        print(offset.x)
    }
    
//    @objc func isDataGet(notification: NSNotification) {
//        let dicInfo:Dictionary = notification.userInfo!
//        let obj:NSObject = notification.object as! NSObject
//        
//    }
}

