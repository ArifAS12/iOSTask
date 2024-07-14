//
//  SideMenuManager.swift
//  iOSTask
//
//  Created by Arif ww on 13/07/2024.
//

import Foundation
import UIKit



class SideMenuManager {
    
    
    
    static let shared = SideMenuManager()
    
    private var sideMenuController: SideMenuVC?
    private var dimmedView: UIView?
    
    private init() {}
    
    func presentSideMenu(from viewController: UIViewController) {
        let sideMenu = SideMenuVC.instantiate(storyBoardName: "SideMenu")
   
        sideMenu.modalPresentationStyle = .overCurrentContext
        
        // Ensure the side menu covers the full height of the presenting view controller
        sideMenu.view.frame = CGRect(x: -300, y: 0, width: 300, height: viewController.view.frame.height)
        
        let dimmedView = UIView(frame: viewController.view.bounds)
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        dimmedView.alpha = 0
        
        self.sideMenuController = sideMenu
        self.dimmedView = dimmedView
        
        viewController.addChild(sideMenu)
        viewController.view.addSubview(dimmedView)
        viewController.view.addSubview(sideMenu.view)
        sideMenu.didMove(toParent: viewController)
        
        UIView.animate(withDuration: 0.3, animations: {
            dimmedView.alpha = 1
            sideMenu.view.frame.origin.x = 0
        })
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSideMenu))
        dimmedView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissSideMenu() {
        guard let sideMenu = sideMenuController, let dimmedView = dimmedView else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            dimmedView.alpha = 0
            sideMenu.view.frame.origin.x = -300
        }) { _ in
            sideMenu.willMove(toParent: nil)
            sideMenu.view.removeFromSuperview()
            sideMenu.removeFromParent()
            dimmedView.removeFromSuperview()
            
            self.sideMenuController = nil
            self.dimmedView = nil
        }
    }
    
    func dismissMenuOnItemClick(){
        
        self.dismissSideMenu()
    }
    
    
   
}

