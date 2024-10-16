import TabularData

extension DataFrame: CustomStringConvertible {
    /// [Common] Shows the table
    public var description: String {
        return description(
            options: .init(
                maximumLineWidth: 300,
                maximumRowCount: 200,
                includesColumnTypes: true
            )
        )
    }
}
