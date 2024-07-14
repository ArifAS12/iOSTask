//
//  DashboardViewModel.swift
//  iOSTask
//
//  Created by Arif ww on 13/07/2024.
//

import Foundation

class DashboardViewModel{
    
    lazy var statsList: [CourseStatsModel] = []
    lazy var courseList: [CourseModel] = []
    lazy var weekList: [WeekModel] = []
    init() {
         prepareStatsList()
         prepareCoursesList()
        prepareWeekList()
        
    }
    
    private func prepareStatsList() {
        statsList = [
            CourseStatsModel(quanity: "5", title: "Course"),
            CourseStatsModel(quanity: "12", title: "Complete"),
            CourseStatsModel(quanity: "17", title: "Total")
            
         ]
     }
    
    private func prepareCoursesList() {
        courseList = [
            
            CourseModel(imageName: "course", title: "Course User Experience Design System", date: "09 May 2024", time: "08:00 - 10:00", remTime: "1h 30m", desc: "If you're a designer moving into a more complex digital world or a developer who has o occasionally function as a designer as well, this course is for you.", downloadLink: "", downloadAbleFileName: "User Experience Design.pdf"),
            CourseModel(imageName: "course_detail", title: "User Interface Design Fundamentals", date: "09 April 2020", time: "11:00 - 12:00", remTime: "2h 30m", desc: "If you're a designer moving into a more complex digital world or a developer who has o occasionally function as a designer as well, this course is for you.", downloadLink: "", downloadAbleFileName: "User Experience Design.pdf")
            
        
         ]
     }
    
    private func prepareWeekList() {
        weekList = getCurrentMonthDates()
        if let currentDayIndex = self.currentDayIndex{
          selectCurrentDay(at: currentDayIndex)
        }
     }
    var currentDayIndex: Int? {
        let today = Date()
        _ = Calendar.current
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        let currentDay = dayFormatter.string(from: today)
        
        return weekList.firstIndex { $0.date == currentDay }
    }
    
    func getCurrentMonthDates() -> [WeekModel] {
        var datesList = [WeekModel]()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd EEE"

        // Get the current date
        let currentDate = Date()

        // Get the range of days in the current month
        let range = calendar.range(of: .day, in: .month, for: currentDate)!

        // Iterate over each day in the current month
        for day in range {
            var components = calendar.dateComponents([.year, .month], from: currentDate)
            components.day = day
            if let date = calendar.date(from: components) {
                let formattedDate = dateFormatter.string(from: date)
                let dateParts = formattedDate.split(separator: " ")
                if dateParts.count == 2 {
                    let dateModel = WeekModel(dayName: String(dateParts[1]), date: String(dateParts[0]))
                    datesList.append(dateModel)
                }
            }
        }

        return datesList
    }
    

    
    func selectCurrentDay(at index: Int) {
        for i in 0..<weekList.count {
            weekList[i].isSelected = (i == index)
        }
    }
    
}
