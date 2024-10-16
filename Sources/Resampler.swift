import Foundation
import Accelerate

///
/// # BaseResampler
///

/// BaseResampler (don't use this one directly; use a subclass).
open class BaseResampler<T> where T: BinaryFloatingPoint & Strideable, T.Stride == T {
    public let xVals: [T]
    public let targetCount: Int

    public init?(_ xVals: [T], targetCount: Int) {
        guard xVals.isAscending(), targetCount > 1 else {
            return nil
        }
        self.xVals = xVals
        self.targetCount = targetCount
    }

    public lazy var relativeExtent: T = {
        relativeDistances.last!
    }()

    /// xVal distances from first xVal
    public lazy var relativeDistances: [T] = {
        xVals.map { $0 - xVals.first! }
    }()

    public lazy var targetInterval: T = {
        relativeExtent / T(targetCount - 1)
    }()

    public lazy var targetStride: StrideThrough<T> = {
        stride(from: xVals.first!, through: xVals.last!, by: targetInterval)
    }()

    public lazy var targetVals: [T] = {
        Array(targetStride)
    }()

    /// Resample the specified values, interpolating them over the target.
    open func resample(_: [T]) -> [T] {
        fatalError("resample() not implemented in base class; use a subclass instead")
    }
}

///
/// # BaseIndiceResampler: BaseResampler
///

/// A base resampler to be subclassed by resamplers requiring indiced values (don't use this one directly; use a subclass).
open class BaseIndiceResampler<T>: BaseResampler<T> where T: BinaryFloatingPoint & Strideable, T.Stride == T {
    internal var isValid: Bool {
        xVals.count == targetIndices.count
    }

    internal lazy var targetIndiceRange: ClosedRange<T> = {
        0 ... T(targetCount - 1)
    }()

    /// The indices to the output vector.
    internal lazy var targetIndices: [T] = {
        guard let first = relativeDistances.first,
              let last = relativeDistances.last
        else { return [] }
        let minMax = (min: first, max: last)
        //        let normDistances = relativeDistances.normalized(to: targetIndiceRange, from: minMax) ?? []
        let normDistances = relativeDistances.normalizedMinMax(to: targetIndiceRange) ?? []
        
        // NOTE the final 'normalized' interval may be slightly less than desired (198.999999 vs 199.0),
        // so coerce all to whole numbers via standard rounding.
        return normDistances.map { $0.rounded() }
    }()
}

///
/// # Resamplers: (BaseResampler | BaseIndiceResampler)
///

/// A double-precision resampler that employs a linear interpolator from Apple's Accelerate framework.
open class AccelLerpResamplerD: BaseIndiceResampler<Double> {
    override public func resample(_ yVals: [Double]) -> [Double] {
        guard isValid, xVals.count == yVals.count else { return [] }
        return vDSP.linearInterpolate(values: yVals, atIndices: targetIndices)
    }
}

/// A single-precision resampler that employs a linear interpolator from Apple's Accelerate framework.
open class AccelLerpResamplerS: BaseIndiceResampler<Float> {
    override public func resample(_ yVals: [Float]) -> [Float] {
        guard isValid, xVals.count == yVals.count else { return [] }
        return vDSP.linearInterpolate(values: yVals, atIndices: targetIndices)
    }
}

/// A basic resampler that employs a pure-Swift linear interpolator (aka lerp).
open class LerpResampler<T>: BaseResampler<T> where T: BinaryFloatingPoint & Strideable, T.Stride == T {
    override public func resample(_ yVals: [T]) -> [T] {
        guard xVals.count == yVals.count else { return [] }
        let lerp = LinearInterpolator(xVals: xVals, yVals: yVals)
        return targetStride.map { lerp.interpolate($0) }
    }
}

///
/// # LinearInterpolator
/// Used by LerpResampler
///

/// A pure-Swift implementation of a linear interpolator.
public struct LinearInterpolator<T> where T: BinaryFloatingPoint {
    @usableFromInline
    internal let n: Int

    @usableFromInline
    internal let xVals: [T]

    @usableFromInline
    internal let yVals: [T]

    public init(xVals: [T], yVals: [T]) {
        assert(xVals.count == yVals.count)
        n = xVals.count - 1
        self.xVals = xVals
        self.yVals = yVals
    }
    
    @inlinable
    public func interpolate(_ t: T) -> T {
        if t <= xVals[0] { return yVals[0] }
        for i in 1 ... n {
            if t <= xVals[i] {
                return (t - xVals[i - 1]) * (yVals[i] - yVals[i - 1]) / (xVals[i] - xVals[i - 1]) + yVals[i - 1]
            }
        }
        return yVals[n]
    }
}
