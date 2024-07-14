//
//  SideMenuVC.swift
//  iOSTask
//
//  Created by Arif ww on 13/07/2024.
//

import UIKit


class SideMenuVC: UIViewController, Storyboarded {
    @IBOutlet weak var tblMenu: UITableView!
    
    var viewModel = SideMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegatesAndDataSources()
        
    }
    func setDelegatesAndDataSources(){
     
        tblMenu.delegate = self
        tblMenu.dataSource = self
    }
    

}


extension SideMenuVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.menuItems.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as? MenuItemCell{
                cell.lblTitle.text = viewModel.menuItems[indexPath.row]
                return cell
            }else{
                return UITableViewCell()
            }
            
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            Router.pop(from: self)
        }else{
            SideMenuManager.shared.dismissMenuOnItemClick()
        }
        
        
    }
}
