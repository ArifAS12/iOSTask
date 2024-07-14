//
//  CourseCollCell.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import UIKit

class CourseCollCell: UICollectionViewCell {
    static let identifier = "CourseCollCell"
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBg: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configure(obj: CourseStatsModel){
        self.lblNum.text = obj.quanity
        self.lblTitle.text = obj.title
    }
}
