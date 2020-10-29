//
//  Rx+Print.swift
//  FastPackAPI
//
//  Created by Yume on 2020/10/23.
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
    private var printValue: Observable<Element> {
        return self.map(_printValue)
    }
    
    private var printError: Observable<Element> {
        return self.catchError(_printError)
    }

    var print: Observable<Element> {
        return self.printValue.printError
    }
}

// MARK: PrimitiveSequence
/// Single SingleTrait
/// Maybe MaybeTrait
/// Completable CompletableTrait
public extension PrimitiveSequence where Trait == SingleTrait {
    private var printValue: Single<Element> {
        return self.map(_printValue)
    }
    
    private var printError: Single<Element> {
        return self.catchError(_printError)
    }

    var print: Single<Element> {
        return self.printValue.printError
    }
}

public extension PrimitiveSequence where Trait == MaybeTrait {
    private var printValue: Maybe<Element> {
        return self.map(_printValue)
    }
    
    private var printError: Maybe<Element> {
        return self.catchError(_printError)
    }

    var print: Maybe<Element> {
        return self.printValue.printError
    }
}

//public extension PrimitiveSequence where Trait == CompletableTrait {
//    var print: Completable {
//        return self.catchError(_printError)
//    }
//}

// MARK: SharedSequence
/// Signal SignalSharingStrategy
/// Driver DriverSharingStrategy
public extension SharedSequence {
    private var _print: SharedSequence<SharingStrategy, Element> {
        return self.map(_printValue)
    }
}

private func _printValue<Element>(_ element: Element) -> Element {
    Swift.print(element)
    return element
}

private func _printError<Element>(_ error: Error) throws -> Element {
    Swift.print(error)
    throw error
}
