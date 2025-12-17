import Foundation

public extension Date {
    // TODO: TEST
    ///
    ///     print(Date.now.round(to: 1, .year).formatted())
    ///     print(Date.now.round(to: 1, .month).formatted())
    ///     print(Date.now.round(to: 1, .day).formatted())
    ///     print(Date.now.round(to: 1, .hour).formatted())
    ///     print(Date.now.round(to: 1, .minute).formatted())
    ///     print(Date.now.round(to: 1, .second).formatted())
    ///
    /// Returns date where **-component** is rounded to its closest
    /// multiple of **-amount**. Warning: month and day start at 1
    /// so round(to: 6, .month) will either return month 1 or 7!
    func round(to amount: Int, _ component: Calendar.Component) -> Date {
        let cal = Calendar.current
        var value = cal.component(component, from: self)

        if [.month, .day].contains(component) {
            // Months and days start at 1, time/year starts at 0
            value -= 1
        }

        // Compute nearest multiple of amount
        let fraction = Double(value) / Double(amount)
        let roundedValue = Int(fraction.rounded()) * amount
        let newDate = cal.date(byAdding: component, value: roundedValue - value, to: self)!

        return newDate.floorAllComponents(before: component)
    }

    // TODO: TEST
    /// Returns date where all components before paramater are set to
    /// their beginning value; day and month to 1 and everything else
    /// to 0
    func floorAllComponents(before component: Calendar.Component) -> Date {
        // All components to round ordered by length
        let components = [Calendar.Component.year, .month, .day, .hour, .minute, .second, .nanosecond]

        guard let index = components.index(of: component) else {
            fatalError("Wrong component")
        }

        let cal = Calendar.current
        var date = self

        components.suffix(from: index + 1).reversed().forEach { roundComponent in
            var value = cal.component(roundComponent, from: date) * -1
            if [.month, .day].contains(roundComponent) {
                // Months and days start at 1, time/year starts at 0
                value += 1
            }
            date = cal.date(byAdding: roundComponent, value: value, to: date)!
        }

        return date
    }
}
