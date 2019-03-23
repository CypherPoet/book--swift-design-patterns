import Foundation

class RemindersCalendarDelegate: CalendarDelegate {
    var parentController: ReminderPresenting?
    
    func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected the date \"\(date)\"")
    }
    
    func calendar(_ calendar: Calendar, willDisplay year: Int) {
        parentController?.yearChanged(to: year)
    }
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        return true
    }
    
}
