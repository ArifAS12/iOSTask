//
//  HomeVC.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var categoryCollView: UICollectionView!
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        categoryCollView.delegate = self
        categoryCollView.dataSource = self
        registerCells()
        
    }
    
    private func registerCells() {
        categoryCollView.register(UINib(nibName: CategoryCollCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollCell.identifier)
        
    }
    
    
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollCell.identifier, for: indexPath) as? CategoryCollCell{
            cell.configure(obj: viewModel.categories[indexPath.item])
            return cell
        }else{
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            Router.showDashboard(from: self)
        default:
            Router.showSampleVC(from: self)
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width / 2.15
        return CGSize(width: width, height: width)
    }
    
}
