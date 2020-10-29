//
//  ToggleViewModel.swift
//  FastPackView1
//
//  Created by Yume on 2020/9/26.
//

import RxSwift
import RxCocoa
import RxRelay

public final class ToggleViewModel: ViewModelType {
    public struct Input {
        let toggle: ControlEvent<Void>
        let defaultValue: Bool
        public init(toggle: ControlEvent<Void>, defaultValue: Bool = false) {
            self.toggle = toggle
            self.defaultValue = defaultValue
        }
    }

    public struct Output {
        let value: Driver<Bool>
    }

    deinit {
        print("\(self) deinit")
    }

    public final let input: Input
    public final var output: Output {
        return .init(
            value: self._value.asDriver()
        )
    }

    private final let disposeBag = DisposeBag()

    private let _value: BehaviorRelay<Bool>
    public init(input: Input) {
        self.input = input
        self._value = .init(value: input.defaultValue)

        self.negative
            .bind(to: self._value)
            .disposed(by: disposeBag)
    }

    private final lazy var negative = input.toggle.map { [unowned self] _ in
        !self._value.value
    }
}
