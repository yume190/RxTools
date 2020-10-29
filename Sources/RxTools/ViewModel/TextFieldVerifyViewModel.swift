//
//  TextFieldVerifyViewModel.swift
//  FastPackView1
//
//  Created by Yume on 2020/9/29.
//

import Foundation
import RxCocoa

public final class TextFieldVerifyViewModel: ViewModelType {
    public struct Input {
        let text: ControlProperty<String>
        let verify: (String) -> Bool
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

    private lazy var _valid = self.input.text
        .map(self.input.verify)
        .asDriver(onErrorJustReturn: false)
}
