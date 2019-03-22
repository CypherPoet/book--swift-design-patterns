import Foundation

protocol CalendarDelegate: class {
    func calendar(_ calendar: Calendar, willDisplay year: Int)
    func calendar(_ calendar: Calendar, didSelect date: Date)

    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool
}
