//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Paul Onawola on 24/12/2023.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())

                ForEach(modelData.cateogries.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.cateogries[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a landmark")
        }

    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
