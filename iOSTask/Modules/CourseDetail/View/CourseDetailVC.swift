//
//  CourseDetailVC.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import UIKit

class CourseDetailVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblRemainingTime: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblFileName: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    
    
    var courseObj: CourseModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    
    func setUpUI() {
        
        guard let courseObj = courseObj else {
            return
        }
        let viewModel = CourseDetailViewModel(course: courseObj)
        self.lblTitle.text = viewModel.title
        self.lblRemainingTime.text = viewModel.remTime
        self.lblFileName.text = viewModel.fileName
        self.lblDate.text = viewModel.date
        self.lblDesc.text = viewModel.description
        self.imgMain.image = UIImage(named: viewModel.imageName)
    }
    
    @IBAction func backAction(){
        Router.pop(from: self)
    }
    
    
}
