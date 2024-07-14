//
//  DashboardVC.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import UIKit

class DashboardVC:  BaseViewController, Storyboarded{
    @IBOutlet weak var coursesCollView: UICollectionView!
    @IBOutlet weak var weekCollView: UICollectionView!
    @IBOutlet weak var courseTblView: UITableView!
    @IBOutlet weak var topViewBg: UIView!
    private let viewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setDelegatesAndDataSources()
        registerCells()
        setUpUI()
        
        
    }
    
    func setUpUI(){
        self.topViewBg.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
    }
    
    
    
    func setDelegatesAndDataSources(){
        coursesCollView.delegate = self
        coursesCollView.dataSource = self
        weekCollView.delegate = self
        weekCollView.dataSource = self
        courseTblView.delegate = self
        courseTblView.dataSource = self
    }
    
    private func registerCells() {
        coursesCollView.register(UINib(nibName: CourseCollCell.identifier, bundle: nil), forCellWithReuseIdentifier: CourseCollCell.identifier)
        
        weekCollView.register(UINib(nibName: WeekCollCell.identifier, bundle: nil), forCellWithReuseIdentifier: WeekCollCell.identifier)
        
        courseTblView.register(UINib(nibName: TodayCourseTblCell.identifier, bundle: nil), forCellReuseIdentifier: TodayCourseTblCell.identifier)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topViewBg.roundCornersContinuously(corners: [.bottomLeft, .bottomRight], radius: 20.0)
        if let currentDayIndex = viewModel.currentDayIndex{
            weekCollView.scrollToItem(at: IndexPath(item: currentDayIndex, section: 0), at: .centeredHorizontally, animated: false)
        }
        
        
    }
    

    
    @IBAction func menuAction(){

        SideMenuManager.shared.presentSideMenu(from: self)
    }
    
}


// MARK: UITableView
extension DashboardVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayCourseTblCell.identifier, for: indexPath) as! TodayCourseTblCell
        cell.configure(obj: self.viewModel.courseList[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Router.showCourseDetail(from: self, courseObj: self.viewModel.courseList[indexPath.row])
    }
    
}

// MARK: UICollectionView
extension DashboardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case coursesCollView:
            return self.viewModel.statsList.count
        case weekCollView:
            return self.viewModel.weekList.count
        default:
            return 0
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case coursesCollView:
            if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollCell.identifier, for: indexPath) as? CourseCollCell{
                cell.configure(obj: self.viewModel.statsList[indexPath.item])
                return cell
            }
        case weekCollView:
            if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekCollCell.identifier, for: indexPath) as? WeekCollCell{
                cell.configure(obj: self.viewModel.weekList[indexPath.item])
             
                return cell
            }
        default:
            print("do nothing")
        }
        
        return UICollectionViewCell()
        
    }
    

    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case coursesCollView:
            let width = collectionView.frame.size.width / 3.6
            return CGSize(width: width, height: 100)
        case weekCollView:
            let width = collectionView.frame.size.width / 6.5
            return CGSize(width: width, height: 90)
        default:
            return CGSize(width: 0, height: 0)
        }
        
        
    }
    
    
}
