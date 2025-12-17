import TabularData
import OrderedCollections

public func debugVectorNormalizers(_ origin: [Double]) {
    print("Debug Vector :: Normalizers")
    debugVector(origin, [
        "normMinMax": { $0.normalizedMinMax() },
        "normMinMax(-5...5)": { $0.normalizedMinMax(to: -5...5) },
        "normMax": { $0.normalizedMax() },
        "normL1": { $0.normalizedL1() },
        "normL2": { $0.normalizedL2() },
        "normMean": { $0.normalizedMean() },
        "normZScore": { $0.normalizedZScore() },
    ])
}

/**
 Print statistics of the array and compare the results of the named processor functions.
 
 - Parameter origin: The origin array
 - Parameter processors: Name and a processor which transforms the origin
 
 */
public func debugVector(
    _ origin: [Double],
    _ processors: OrderedDictionary<String, (_ raw: [Double]) -> [Double]>? = nil
) {
    var results = OrderedDictionary<String, [Double]>()
    results["input"] = origin

    for processor in processors.unwrapped(or: [:]) {
        let name = processor.key
        let fn = processor.value
//        measure(label: name, tests: 100, printResults: true) {
        results[name] = fn(origin)
//        }
    }

    var table = DataFrame()
    for result in results {
        table.append(column: Column(name: result.key, contents: result.value))
    }
    print(table.description(
        options: .init(
            maximumLineWidth: 300,
            maximumCellWidth: 200,
            maximumRowCount: 200,
            includesColumnTypes: true
        )
    ))
    
    var summary = table.summary()
    summary.append(column: Column(name: "sum", contents: results.map({
        $0.value.sum()
    })))
    print(summary.description(
        options: .init(
            maximumLineWidth: 300,
            maximumCellWidth: 200,
            maximumRowCount: 200,
            includesColumnTypes: true
        )
    ))
    //    print(summary.description)
}
