import Foundation


class Calendar {
    weak var delegate: CalendarDelegate?
    
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


extension Calendar {
    func changeDate(to date: Date) {
        selectedDate = date
    }
    
    func changeYear(to year: Int) {
        if delegate?.calendarShouldChangeYear(self) ?? true {
            currentYear = year
        }
    }
}


