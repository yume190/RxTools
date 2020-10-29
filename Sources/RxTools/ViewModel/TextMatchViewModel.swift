//
//  TextMatchViewModel.swift
//  FastPackView1
//
//  Created by Yume on 2020/9/29.
//

import Foundation
import RxCocoa

public final class TextMatchViewModel: ViewModelType {
    public struct Input {
        let first: ControlProperty<String>
        let second: ControlProperty<String>
    }

    public struct Output {
        let valid: Driver<Bool>
    }

    deinit {
        print("\(self) deinit")
    }

    public final let input: Input
    public final var output: Output {
        return .init(valid: self._valid)
    }

    public init(input: Input) {
        self.input = input
    }

    private lazy var _valid: Driver<Bool> = Driver
        .combineLatest(self.input.first.asDriver(), self.input.second.asDriver())
        .map { (first, second) -> Bool in
            guard  first != "" else {return false}
            guard  second != "" else {return false}
            return first == second
        }
}
