//
//  ViewModelType.swift
//  
//
//  Created by Yume on 2020/10/28.
//

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    var input: Input { get }
    var output: Output { get }
}
