//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Paul Onawola on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
