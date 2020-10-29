//
//  Rx+Extension.swift
//  FastPack1
//
//  Created by Yume on 2020/10/14.
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
    var optional: Observable<Element?> {
        return self.map(toOptional)
    }
}

// MARK: PrimitiveSequence
/// Single SingleTrait
/// Maybe MaybeTrait
/// Completable CompletableTrait
public extension PrimitiveSequence where Trait == SingleTrait {
    var optional: Single<Element?> {
        return self.map(toOptional)
    }
}

public extension PrimitiveSequence where Trait == MaybeTrait {
    var optional: Maybe<Element?> {
        return self.map(toOptional)
    }
}

// MARK: SharedSequence
/// Signal SignalSharingStrategy
/// Driver DriverSharingStrategy
public extension SharedSequence {
    var optional: SharedSequence<SharingStrategy, Element?> {
        return self.map(toOptional)
    }
}

private func toOptional<Element>(_ element: Element) -> Element? {
    return element
}
