//
//  Rx+ToDriver.swift
//  FastPackAPI
//
//  Created by Yume on 2020/10/14.
//

import Foundation
import RxSwift
import RxCocoa

public typealias ErrorHandler = (Swift.Error) -> Void

// MARK: ObservableType
/// Observable
/// BehaviorRelay
/// PublishRelay
/// ControlEvent
/// ControlProperty
public extension ObservableType {
    func asDriverSkipError(_ handler: ErrorHandler? = nil) -> Driver<Element> {
        return self
            .optional
            .asDriverSkipOptional(handler)
    }
    
    func asDriverSkipOptional<T>(_ handler: ErrorHandler? = nil) -> Driver<T> where Element == T? {
        return self
            .catchError {
                handler?($0)
                return .just(nil)
            }
            .asDriver(onErrorJustReturn: nil)
            .filterNil()
    }
}

// MARK: PrimitiveSequence
/// Single SingleTrait Next Error x
/// Maybe MaybeTrait Next Error Comp
/// Completable CompletableTrait  x Error Comp
public extension PrimitiveSequence where Trait == SingleTrait {
    func asDriverSkipError(_ handler: ErrorHandler? = nil) -> Driver<Element> {
        return self
            .optional
            .asDriverSkipOptional(handler)
    }
    
    func asDriverSkipOptional<T>(_ handler: ErrorHandler? = nil) -> Driver<T> where Element == T? {
        return self
            .catchError {
                handler?($0)
                return .just(nil)
            }
            .asDriver(onErrorJustReturn: nil)
            .filterNil()
    }
}

public extension PrimitiveSequence where Trait == MaybeTrait {
    func asDriverSkipError(_ handler: ErrorHandler? = nil) -> Driver<Element> {
        return self
            .optional
            .asDriverSkipOptional(handler)
    }
    
    func asDriverSkipOptional<T>(_ handler: ErrorHandler? = nil) -> Driver<T> where Element == T? {
        return self
            .catchError {
                handler?($0)
                return .just(nil)
            }
            .asDriver(onErrorJustReturn: nil)
            .filterNil()
    }
}

// MARK: SharedSequence
/// Signal SignalSharingStrategy
/// Driver DriverSharingStrategy
public extension SharedSequence {
}
