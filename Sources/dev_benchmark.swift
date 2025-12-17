import Foundation
import OrderedCollections
import TabularData

//benchmark("MyPerformance", [
//    .init(name: "A", block: {
//        35.squareRoot()
//    }),
//    .init(name: "B", block: {
//        sqrt(35.0)
//    })
//])

/// Represents a benchmark that contains a name and a closure to benchmark.
public struct Benchmark {
    let name: String
    let block: () -> Any

    public init(name: String, block: @escaping () -> Any) {
        self.name = name
        self.block = block
    }
}

/// Runs multiple benchmarks and compares their performance.
/// - Parameters:
///   - benchmarks: An array of `Benchmark` objects.
///   - iterations: Number of times to run each benchmark to obtain accurate measurements.
public func benchmark(
    _ name: String,
    _ benchmarks: [Benchmark],
    iterations: Int = 1000
) {
    var results: [(name: String, time: TimeInterval)] = []

    for benchmark in benchmarks {
        let start = CFAbsoluteTimeGetCurrent()

        for _ in 0..<iterations {
            benchmark.block()
        }

        let end = CFAbsoluteTimeGetCurrent()
        let elapsedTime = (end - start) / Double(iterations) // Average time per iteration
        results.append((name: benchmark.name, time: elapsedTime))
    }

    var tab = DataFrame()
    tab.append(column: .init(name: "Name", contents: []))
    tab.append(column: .init(name: "Performance", contents: []))
    tab.append(column: .init(name: "ops/sec", contents: []))

    if let fastest = results.min(by: { $0.time < $1.time }) {
        for result in results {
            let percentageDifference = ((result.time - fastest.time) / fastest.time)
            let opPerSecond = 1 / result.time

            tab.append(valuesByColumn: [
                "Name": result.name,
                "Performance": percentageDifference.formatted(.percent.precision(.fractionLength(...1)).sign(strategy: .always()).locale(Locale(identifier: "fr_FR"))),
                "ops/sec": opPerSecond.formatted(precision: 0)
            ])
        }
    }

    print("\n=== BENCHMARK | \(name) ===")

    print(tab.description(options: .init(
        maximumLineWidth: 400,
        includesColumnTypes: false
    )))
}
