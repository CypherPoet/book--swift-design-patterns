import Foundation

class RemindersCalendarDataSource: CalendarDataSource {
    func calendar(_ calendar: Calendar, add event: String, to date: Date) {
        print("Adding a new event to your itinerary for \(date): \"\(event)\"")
    }
    
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String] {
        return ["Write magical Swift code", "World domination", "Read"]
    }
}
