//
//  UILoadingState.swift
//  Demo
//
//  Created by suresh on 12/5/23.
//

import Foundation

public enum UILoadingState {
    case idle
    case loading
    case failed(error: String)
    case loaded(ip: IPModel)
}

public protocol LoadableObject: ObservableObject {
//    associatedtype Output
    var  state: UILoadingState { get set }
    func load()
}
