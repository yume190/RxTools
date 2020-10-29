//
//  Rx+Result.swift
//  FastPackView1
//
//  Created by Yume on 2020/10/28.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: ObservableType
/// Observable
/// BehaviorRelay
/// PublishRelay
/// ControlEvent
/// ControlProperty
public extension ObservableType {
    var result: Observable<Result<Element, Error>> {
        return self.map { return Result.success($0) }
    }
    
    func mapResult<R>(_ selector: @escaping (Self.Element) throws -> R) -> Observable<Result<R, Error>> {
        return self.map { (element)  in
            return Result<R, Error> { () -> R in
                return try selector(element)
            }
        }
    }
    
    func mapResultError<T, OldError: Error, NewError: Error>(_ selector: @escaping (OldError) -> NewError) -> Observable<Result<T, NewError>> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) in
            return result.mapError(selector)
        }
    }
    
    func unwrapError<T, U, OldError: Error>(_ selector: @escaping (OldError) -> U) -> Observable<U?> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) -> U? in
            switch result {
            case .success:
                return nil
            case .failure(let err):
                return selector(err)
            }
        }
    }
}

// MARK: PrimitiveSequence
/// Single SingleTrait
/// Maybe MaybeTrait
/// Completable CompletableTrait
public extension PrimitiveSequence where Trait == SingleTrait {
    var result: Single<Result<Element, Error>> {
        return self.map { return Result.success($0) }
    }
    
    func mapResult<R>(_ selector: @escaping (Self.Element) throws -> R) -> Single<Result<R, Error>> {
        return self.map { (element)  in
            return Result<R, Error> { () -> R in
                return try selector(element)
            }
        }
    }
    
    func mapResultError<T, OldError: Error, NewError: Error>(_ selector: @escaping (OldError) -> NewError) -> Single<Result<T, NewError>> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) in
            return result.mapError(selector)
        }
    }
    
    func unwrapError<T, U, OldError: Error>(_ selector: @escaping (OldError) -> U) -> Single<U?> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) -> U? in
            switch result {
            case .success:
                return nil
            case .failure(let err):
                return selector(err)
            }
        }
    }
}

public extension PrimitiveSequence where Trait == MaybeTrait {
    var result: Maybe<Result<Element, Error>> {
        return self.map { return Result.success($0) }
    }
    
    func mapResult<R>(_ selector: @escaping (Self.Element) throws -> R) -> Maybe<Result<R, Error>> {
        return self.map { (element)  in
            return Result<R, Error> { () -> R in
                return try selector(element)
            }
        }
    }
    
    func mapResultError<T, OldError: Error, NewError: Error>(_ selector: @escaping (OldError) -> NewError) -> Maybe<Result<T, NewError>> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) in
            return result.mapError(selector)
        }
    }
    
    func unwrapError<T, U, OldError: Error>(_ selector: @escaping (OldError) -> U) -> Maybe<U?> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) -> U? in
            switch result {
            case .success:
                return nil
            case .failure(let err):
                return selector(err)
            }
        }
    }
}

// MARK: SharedSequence
/// Signal SignalSharingStrategy
/// Driver DriverSharingStrategy
public extension SharedSequence {
    var result: SharedSequence<Self.SharingStrategy, Result<Element, Error>> {
        return self.map { return Result.success($0) }
    }
    
    func mapResult<R>(_ selector: @escaping (Self.Element) throws -> R) -> SharedSequence<Self.SharingStrategy, Result<R, Error>> {
        return self.map { (element)  in
            return Result<R, Error> { () -> R in
                return try selector(element)
            }
        }
    }
    
    func mapResultError<T, OldError: Error, NewError: Error>(_ selector: @escaping (OldError) -> NewError) -> SharedSequence<Self.SharingStrategy, Result<T, NewError>> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) in
            return result.mapError(selector)
        }
    }
    
    func unwrapError<T, U, OldError: Error>(_ selector: @escaping (OldError) -> U) -> SharedSequence<Self.SharingStrategy, U?> where Element == Result<T, OldError> {
        return self.map { (result: Result<T, OldError>) -> U? in
            switch result {
            case .success:
                return nil
            case .failure(let err):
                return selector(err)
            }
        }
    }
}

//protocol Wrapper {
//    associatedtype Wrapped<T>
//
//    static func wrap<T>(_ t: T) -> Wrapped<T>
//}
