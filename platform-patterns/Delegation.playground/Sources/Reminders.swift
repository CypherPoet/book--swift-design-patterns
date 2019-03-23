import Foundation

/**
    An app-specific class.
 
    Architecturally, this would have role similar to that of a `UITableViewController`
 */
class Reminders {
    var title: String
    lazy var calendar = Calendar()
    
    init(title: String = "Year: 2020") {
        self.title = title

        calendar.delegate = self
        calendar.dataSource = RemindersCalendarDataSource()
    }
}


// MARK: - CalendarDelegate

extension Reminders: CalendarDelegate {
    func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected the date \"\(date)\"")
    }
    
    func calendar(_ calendar: Calendar, willDisplay year: Int) {
        title = "Year: \(year)"
    }
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        return true
    }
}
