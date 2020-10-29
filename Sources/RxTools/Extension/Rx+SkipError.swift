//
//  Rx+SkipError.swift
//  FastPackAPI
//
//  Created by Yume on 2020/10/14.
//

import Foundation
import RxSwift
import RxCocoa

//public typealias ErrorHandler = (Swift.Error) throws -> Void

// MARK: ObservableType
/// Observable
/// BehaviorRelay
/// PublishRelay
/// ControlEvent
/// ControlProperty
public extension ObservableType {
    func skipError(_ handler: ErrorHandler? = nil) -> Observable<Element> {
        self
            .optional
            .skipErrorOptional(handler)
    }
    
    func skipErrorOptional<T>(_ handler: ErrorHandler? = nil) -> Observable<T> where Element == T? {
        return self
            .catchError {
                handler?($0)
                return .just(nil)
            }
            .filterNil()
    }
    
    func filterNil<T>() -> Observable<T> where Element == T? {
        return self
            .filter { $0 != nil }
            .map { $0! }
    }
    
    func skipResultError<T>(_ handler: ErrorHandler? = nil) -> Observable<T> where Element == Result<T, Error> {
        return self
            .map(_skipResultError(handler))
            .filterNil()
    }
}

// MARK: PrimitiveSequence
/// Single SingleTrait Next Error x
/// Maybe MaybeTrait Next Error Comp
/// Completable CompletableTrait  x Error Comp
public extension PrimitiveSequence where Trait == SingleTrait {
    func skipError(_ handler: ErrorHandler? = nil) -> Maybe<Element> {
        self
            .optional
            .skipErrorOptional(handler)
    }
    
    func skipErrorOptional<T>(_ handler: ErrorHandler? = nil) -> Maybe<T> where Element == T? {
        return self
            .catchError {
                handler?($0)
                return .just(nil)
            }
            .filterNil()
    }
    
    func filterNil<T>() -> Maybe<T> where Element == T? {
        return self
            .filter { $0 != nil }
            .map { $0! }
    }
    
    func skipResultError<T>(_ handler: ErrorHandler? = nil) -> Maybe<T> where Element == Result<T, Error> {
        return self
            .map(_skipResultError(handler))
            .filterNil()
    }
}

public extension PrimitiveSequence where Trait == MaybeTrait {
    func skipError(_ handler: ErrorHandler? = nil) -> Maybe<Element> {
        self
            .optional
            .skipErrorOptional(handler)
    }
    
    func skipErrorOptional<T>(_ handler: ErrorHandler? = nil) -> Maybe<T> where Element == T? {
        return self
            .catchError {
                handler?($0)
                return .just(nil)
            }
            .filterNil()
    }
    
    func filterNil<T>() -> Maybe<T> where Element == T? {
        return self
            .filter { $0 != nil }
            .map { $0! }
    }
    
    func skipResultError<T>(_ handler: ErrorHandler? = nil) -> Maybe<T> where Element == Result<T, Error> {
        return self
            .map(_skipResultError(handler))
            .filterNil()
    }

}

// MARK: SharedSequence
/// Signal SignalSharingStrategy
/// Driver DriverSharingStrategy
public extension SharedSequence {
    func filterNil<T>() -> SharedSequence<SharingStrategy, T> where Element == T? {
        return self
            .filter { $0 != nil }
            .map { $0! }
    }

    func skipResultError<T>(_ handler: ErrorHandler? = nil) -> SharedSequence<SharingStrategy, T> where Element == Result<T, Error> {
        return self
            .map(_skipResultError(handler))
            .filterNil()
    }
}

fileprivate func _skipResultError<T>(_ handler: ErrorHandler? = nil) -> (Result<T, Error>) -> T? {
    return { (res: Result<T, Error>) -> T? in
        switch res {
        case .success(let element):
            return element
        case .failure(let error):
            handler?(error)
            return nil
        }
    }
}
