//
//  SwiftUIViewNws.swift
//  FindMyIP
//
//  Created by suresh on 12/5/23.
//

import SwiftUI

public struct SwiftUIView: View {
    public var body: some View {
        IPDetailsView(viewModel: IPViewModel())
    }
    public init() {
        
    }
}

#Preview {
    SwiftUIView()
}
