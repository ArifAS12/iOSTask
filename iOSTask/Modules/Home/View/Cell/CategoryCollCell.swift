//
//  CategoryCollCell.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import UIKit

class CategoryCollCell: UICollectionViewCell {
    static let identifier = "CategoryCollCell"
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(obj: CategoryTitleModel){
        self.lblTitle.text = obj.title
        self.img.image = UIImage(systemName: obj.img)
        
    }

}
