//
//  MockIPViewModel.swift
//  Demo
//
//  Created by suresh on 12/5/23.
//

import Foundation
import Combine

public class MockIPViewModel  {
    public var ipmodel: IPModel?
    private var photosFetcher: IPDetailsFetchable = MockDetailsFetchable()
    private var cancellable = Set<AnyCancellable>()
    @Published public var state = UILoadingState.idle
    
    public init(ipDetailsFetcher: IPDetailsFetchable = MockDetailsFetchable() , ipInfo: IPModel?) {
        self.photosFetcher = ipDetailsFetcher
        self.ipmodel = ipInfo
    }
}
    
extension MockIPViewModel: IPDetailsModelInterface {
    public func load() {
        state = .loaded(ip: self.ipmodel!)
    }
}
