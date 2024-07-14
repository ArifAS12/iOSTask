//
//  HomeViewModel.swift
//  iOSTask
//
//  Created by Arif ww on 12/07/2024.
//

import Foundation


class HomeViewModel {
    
    var categories: [CategoryTitleModel] = []
    init() {
           prepareCategories()
       }
    
    
    private func prepareCategories() {
        categories = [
            CategoryTitleModel(title: "Dashboard", img:  "star"),
            CategoryTitleModel(title: "Schedule", img: "heart"),
            CategoryTitleModel(title: "Forum", img: "bell"),
            CategoryTitleModel(title: "History", img: "flame"),
            CategoryTitleModel(title: "Settings", img: "bolt"),
            CategoryTitleModel(title: "FAQ?", img: "leaf")
         ]
     }
    
    
}
