//
//  Rx+Take.swift
//  FastPackView1
//
//  Created by Yume on 2020/10/28.
//

import Foundation
import RxSwift
import RxCocoa

public extension Driver {
    func take(_ count: Int) -> Driver<Element> {
        return self.asObservable()
            .take(count)
            .asDriverSkipError()
    }
}
