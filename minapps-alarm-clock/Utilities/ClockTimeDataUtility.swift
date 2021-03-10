import Foundation

enum ClockTimeDataUtility
{

    static func makeFutureDateFrom(target: ClockTimeData, with origin: ClockTimeData) -> Date
    {
        if target > origin
        {
            return ClockTimeDataUtility.makeDateForTodayFrom(target: target)
        }
        else
        {
            return ClockTimeDataUtility.makeDateForNextDayFrom(target: target)
        }
    }
    
    static func makeDateForTodayFrom(target: ClockTimeData) -> Date
    {
        let todaysDate = Date()
        let cal = Calendar.current
        let thisYear = cal.component(.year, from: todaysDate)
        let thisMonth = cal.component(.month, from: todaysDate)
        let thisDay = cal.component(.day, from: todaysDate)
        
        var dateData = DateComponents()
        dateData.year = thisYear
        dateData.month = thisMonth
        dateData.day = thisDay
        dateData.hour = target.hours24
        dateData.minute = target.minutes
        dateData.timeZone = TimeZone.current
        dateData.second = 0
        
        return cal.date(from: dateData)!
    }
    
    static func makeDate(from target: ClockTimeData, forNextWeekday weekday: AlarmUtility.Weekday, startingFrom originDay: AlarmUtility.Weekday, andTime origin: ClockTimeData) -> Date
    {
        var date = ClockTimeDataUtility.makeFutureDateFrom(target: target, with: origin)
        
        let startCode = originDay.rawValue
        let targetCode = weekday.rawValue
        
        
        let daysOffset = Double((7 - startCode + targetCode) % 7)
        
        let oneDay: TimeInterval = 86_400.0 // Number of seconds in a day
        date.addTimeInterval(oneDay * daysOffset)
        
        return date
    }
    
    static func makeDateForNextDayFrom(target: ClockTimeData) -> Date
    {
        var date = ClockTimeDataUtility.makeDateForTodayFrom(target: target)
        
        date.addTimeInterval(86_400.0)
        
        return date
    }
    
}
