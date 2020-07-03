//
//  CollectionViewTitleCell.swift
//  CollectionViewDateTest
//
//  Created by Dustin on 2019/9/25.
//  Copyright © 2019 Dustin. All rights reserved.
//

import UIKit

protocol TitleScrollDelegate {
    func TitleScroll(cell: CollectionViewTitleCell)
}

class CollectionViewTitleCell: UICollectionViewCell,UIScrollViewDelegate {
    @IBOutlet weak var l_date: UILabel!
    @IBOutlet weak var l_morning: UILabel!
    @IBOutlet weak var l_evening: UILabel!
    @IBOutlet weak var l_night: UILabel!
    @IBOutlet weak var sc_title: UIScrollView!
    
    var delegate: TitleScrollDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        sc_title.isUserInteractionEnabled = true
        sc_title.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
    }

    @objc func tapAction(sender:UIScrollView){
        self.delegate?.TitleScroll(cell: self)
    }
}
