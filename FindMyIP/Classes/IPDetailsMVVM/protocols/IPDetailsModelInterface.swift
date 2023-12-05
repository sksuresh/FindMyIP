//
//  IPDetailsModelInterface.swift
//  Demo
//
//  Created by suresh on 12/5/23.
//

import Foundation

 public protocol IPDetailsModelInterface: LoadableObject {
    var ipmodel: IPModel? { get }
//    init(ipDetailsFetcher: IPDetailsFetchable, ipInfo: IP?)
    func load()
}
extension IPDetailsModelInterface {
    
}
