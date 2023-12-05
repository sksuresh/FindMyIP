//
//  IPViewModel.swift
//  Demo
//
//  Created by suresh on 12/3/23.
//

import Foundation
import Combine

public class IPViewModel: IPDetailsModelInterface  {
    public var ipmodel: IPModel?
    private let dataFetcher: IPDetailsFetchable
    private var cancellable = Set<AnyCancellable>()
    @Published public var state = UILoadingState.idle
    
    public init(ipDetailsFetcher: IPDetailsFetchable = DetailsFetchable()) {
        self.dataFetcher = ipDetailsFetcher
    }
    
   public func load() {
        state = .loading
        dataFetcher
            .fetchIPDetails(type: IPModel.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure(let error):
                    if let err = error as? APIError {
                        self?.state = UILoadingState.failed(error: err.message())
                    }
                case .finished:
                    break
                }
            } receiveValue: { [weak self] photosResponse in
                self?.ipmodel = photosResponse
                self?.state = UILoadingState.loaded(ip: photosResponse)
            }
            .store(in: &cancellable)
    }
}
