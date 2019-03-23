import Foundation

class Reminders {
    var title: String
    lazy var calendar = Calendar()
    
    init(title: String = "Year: 2020") {
        self.title = title

        calendar.delegate = self
        calendar.dataSource = self
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


// MARK: - CalendarDataSource

extension Reminders: CalendarDataSource {
    func calendar(_ calendar: Calendar, add event: String, to date: Date) {
        print("Adding a new event to your itinerary for \(date): \"\(event)\"")
    }
    
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String] {
        return ["Write magical Swift code", "World domination", "Read"]
    }
}
