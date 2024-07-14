//
//  WeekCollCell.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import UIKit

class WeekCollCell: UICollectionViewCell {
    static let identifier = "WeekCollCell"
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBg: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(obj: WeekModel){
        self.lblNum.text = obj.date
        self.lblTitle.text = obj.dayName
        if obj.isSelected{
            self.viewBg.backgroundColor = .orange
            self.lblNum.textColor = .white
            self.lblTitle.textColor = .white
        }else{
            self.viewBg.backgroundColor = .clear
            self.lblNum.textColor = .black
            self.lblTitle.textColor = .darkGray
        }
    }

}
