//
//  CourseDetailViewModel.swift
//  iOSTask
//
//  Created by Arif ww on 13/07/2024.
//

import Foundation


class CourseDetailViewModel{
    
    let course: CourseModel
    
    init(course: CourseModel) {
        self.course = course
    }
    
    
    var title: String {
        return course.title
    }
    
    var remTime: String {
        return "Waiting mentor to start the courses \(course.remTime)"
    }
    
    var fileName: String {
        return course.downloadAbleFileName
    }
    
    var time: String {
        return course.time
    }
    
    var date: String {
        return course.date
    }
    
    var description: String {
        return course.desc
    }
    
    var imageName: String {
        return course.imageName
    }
}
