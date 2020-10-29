//
//  TriggerVM.swift
//  FastPackView1
//
//  Created by Yume on 2020/10/27.
//

import Foundation
import RxCocoa

public final class TriggerVM {
    public let trigger: Driver<Void>
    
    @inlinable
    public init(_ taps: Driver<Void>...) {
        self.trigger = Driver.merge(taps)
    }
    
    @inlinable
    public init<T>(_ element: Driver<T>, _ tap: Driver<Void>) {
        self.trigger = Driver.merge(
            element.map { _ in () },
            tap
        )
    }
    
    @inlinable
    public final func flatMapLatest<O1>(_ o1: Driver<O1>) -> Driver<O1> {
        return self.trigger.flatMapLatest { _ -> Driver<O1> in
            return o1
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1>(_ o1: Driver<O1>) -> Driver<O1> {
        return self.trigger.flatMapLatest { _ -> Driver<O1> in
            return o1.take(1)
        }
    }
    
    @inlinable
    public final func flatMapLatest<O1, O2>(_ o1: Driver<O1>, _ o2: Driver<O2>) -> Driver<(O1, O2)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2)> in
            return Driver.combineLatest(o1, o2)
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1, O2>(_ o1: Driver<O1>, _ o2: Driver<O2>) -> Driver<(O1, O2)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2)> in
            return Driver.combineLatest(o1, o2).take(1)
        }
    }
    
    @inlinable
    public final func flatMapLatest<O1, O2, O3>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>) -> Driver<(O1, O2, O3)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3)> in
            return Driver.combineLatest(o1, o2, o3)
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1, O2, O3>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>) -> Driver<(O1, O2, O3)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3)> in
            return Driver.combineLatest(o1, o2, o3).take(1)
        }
    }
    
    @inlinable
    public final func flatMapLatest<O1, O2, O3, O4>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>) -> Driver<(O1, O2, O3, O4)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4)> in
            return Driver.combineLatest(o1, o2, o3, o4)
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1, O2, O3, O4>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>) -> Driver<(O1, O2, O3, O4)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4)> in
            return Driver.combineLatest(o1, o2, o3, o4).take(1)
        }
    }
    
    @inlinable
    public final func flatMapLatest<O1, O2, O3, O4, O5>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>) -> Driver<(O1, O2, O3, O4, O5)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5)
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1, O2, O3, O4, O5>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>) -> Driver<(O1, O2, O3, O4, O5)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5).take(1)
        }
    }
    
    @inlinable
    public final func flatMapLatest<O1, O2, O3, O4, O5, O6>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>, _ o6: Driver<O6>) -> Driver<(O1, O2, O3, O4, O5, O6)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5, O6)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5, o6)
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1, O2, O3, O4, O5, O6>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>, _ o6: Driver<O6>) -> Driver<(O1, O2, O3, O4, O5, O6)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5, O6)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5, o6).take(1)
        }
    }
    
    @inlinable
    public final func flatMapLatest<O1, O2, O3, O4, O5, O6, O7>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>, _ o6: Driver<O6>, _ o7: Driver<O7>) -> Driver<(O1, O2, O3, O4, O5, O6, O7)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5, O6, O7)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5, o6, o7)
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1, O2, O3, O4, O5, O6, O7>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>, _ o6: Driver<O6>, _ o7: Driver<O7>) -> Driver<(O1, O2, O3, O4, O5, O6, O7)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5, O6, O7)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5, o6, o7).take(1)
        }
    }
    
    @inlinable
    public final func flatMapLatest<O1, O2, O3, O4, O5, O6, O7, O8>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>, _ o6: Driver<O6>, _ o7: Driver<O7>, _ o8: Driver<O8>) -> Driver<(O1, O2, O3, O4, O5, O6, O7, O8)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5, O6, O7, O8)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5, o6, o7, o8)
        }
    }
    
    @inlinable
    public final func flatMapLatestOnece<O1, O2, O3, O4, O5, O6, O7, O8>(_ o1: Driver<O1>, _ o2: Driver<O2>, _ o3: Driver<O3>, _ o4: Driver<O4>, _ o5: Driver<O5>, _ o6: Driver<O6>, _ o7: Driver<O7>, _ o8: Driver<O8>) -> Driver<(O1, O2, O3, O4, O5, O6, O7, O8)> {
        return self.trigger.flatMapLatest { _ -> Driver<(O1, O2, O3, O4, O5, O6, O7, O8)> in
            return Driver.combineLatest(o1, o2, o3, o4, o5, o6, o7, o8).take(1)
        }
    }
    
}
