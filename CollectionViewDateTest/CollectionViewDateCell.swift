//
//  CollectionViewDateCell.swift
//  CollectionViewDateTest
//
//  Created by Dustin on 2019/9/25.
//  Copyright © 2019 Dustin. All rights reserved.
//

import UIKit

protocol DataScrollDelegate {
    func DataScroll(cell: CollectionViewDateCell)
}

class CollectionViewDateCell: UICollectionViewCell,UIScrollViewDelegate{
    @IBOutlet weak var l_date: UILabel!
    @IBOutlet weak var v_view: UIView!
    @IBOutlet weak var sc_date: UIScrollView!
    var delegate: DataScrollDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        sc_date.isUserInteractionEnabled = true
        sc_date.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
    }
    
    @objc func tapAction(sender:UIScrollView){
        self.delegate?.DataScroll(cell: self)
    }
}
