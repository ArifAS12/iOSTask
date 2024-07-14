//
//  SampleVC.swift
//  iOSTask
//
//  Created by Arif ww on 14/07/2024.
//

import UIKit

class SampleVC: UIViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backAction(){
        Router.pop(from: self)
    }

}
