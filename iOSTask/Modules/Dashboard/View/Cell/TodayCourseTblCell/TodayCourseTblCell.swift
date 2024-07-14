//
//  TodayCourseTblCell.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import UIKit

class TodayCourseTblCell: UITableViewCell {
    
    static let identifier = "TodayCourseTblCell"
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(obj: CourseModel){
        self.lblTime.text = obj.time
        self.lblTitle.text = obj.title
        self.img.image = UIImage(named: obj.imageName)
    }
    
}
