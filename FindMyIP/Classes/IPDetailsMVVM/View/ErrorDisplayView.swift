//
//  ErrorDisplayView.swift
//  Demo
//
//  Created by suresh on 12/3/23.
//

import SwiftUI

struct ErrorDisplayView: View {
    @State var errormsg: String
    var retry:()->Void
    var body: some View {
        VStack {
            Text("Failed to download: \(errormsg)").font(.title3)
            Button("retry") {
                retry()
            }
        }
    }
}

#Preview {
    ErrorDisplayView(errormsg: "Failed to download", retry: {})
}
