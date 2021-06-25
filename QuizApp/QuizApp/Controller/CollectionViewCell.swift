//
//  CollectionViewCell.swift
//  QuizApp
//
//  Created by Nguyen Tien on 23/06/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var start: UIButton!
    
    @IBAction func clickStart(_ sender: Any) {
        self.isSelected = true
    }
    
    
}
