import Foundation


class Calendar {
    var delegate: CalendarDelegate?
    var dataSource: CalendarDataSource?
    
    var selectedDate: Date {
        didSet {
            delegate?.calendar(self, didSelect: selectedDate)
        }
    }
    
    var currentYear: Int {
        didSet {
            delegate?.calendar(self, willDisplay: currentYear)
        }
    }
    
    
    init(
        delegate: CalendarDelegate? = nil,
        selectedDate: Date = Date(),
        currentYear: Int = 2020
    ) {
        self.delegate = delegate
        self.selectedDate = selectedDate
        self.currentYear = currentYear
    }
}


// MARK: - Computed Properties

extension Calendar {
    var selectedDateEvents: [String]? {
        return dataSource?.calendar(self, eventsFor: selectedDate)
    }
}


// MARK: - Core Methods

extension Calendar {
    func changeDate(to date: Date) {
        selectedDate = date
    }
    
    func changeYear(to year: Int) {
        if delegate?.calendarShouldChangeYear(self) ?? true {
            currentYear = year
        }
    }
    
    func add(event: String) {
        dataSource?.calendar(self, add: event, to: selectedDate)
    }
}


