//
//  IPDetailsView.swift
//  Demo
//
//  Created by suresh on 12/3/23.
//

import SwiftUI
import Combine

struct IPDetailsView<Model>: View where Model:IPDetailsModelInterface  {
    @StateObject private var viewModel: Model
    init (viewModel: Model) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.load)
        case .loading:
            ProgressView().progressViewStyle(.circular)
        case .loaded(let ip):
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(Array(ip.toArrayOfDict().keys.enumerated()), id: \.element) { _, key  in
                        if let value = ip.toArrayOfDict()[key]  {
                            Text("\(key): \t \(String(describing: value))")
                        }
                    }
                }
                .padding()
            }
        case .failed(let error):
            ErrorDisplayView(errormsg: error, retry: {
                viewModel.load()
            })
        }
    }
}

#Preview {
    IPDetailsView(viewModel: MockIPViewModel(ipInfo:  IPModel(ip: "", network: "547", version: "6.0", city: "Hillsboro", region: "nil", regionCode: nil, country: nil, countryName: "USA", countryCode: nil, countryCodeIso3: nil, countryCapital: nil, countryTld: nil, continentCode: nil, inEu: nil, postal: nil, latitude: nil, longitude: nil, timezone: nil, utcOffset: nil, countryCallingCode: nil, currency: nil, currencyName: nil, languages: nil, countryArea: nil, countryPopulation: nil, asn: nil, org: nil)))
}
