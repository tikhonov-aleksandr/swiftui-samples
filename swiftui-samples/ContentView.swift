//
//  ContentView.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List(filteredRoutes) { route in
                NavigationLink(route.title, value: route)
            }
            .navigationTitle("Samples")
            .searchable(text: $searchText, prompt: "Search samples")
            .routeDestination()
        }
    }
    
    private var filteredRoutes: [SampleRoute] {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return SampleRoute.allCases }
        return SampleRoute.allCases.filter { route in
            route.title.localizedCaseInsensitiveContains(trimmed)
        }
    }
}

struct ProfileSampleView: View {
    var body: some View {
        Text("Profile sample screen.")
            .navigationTitle("Profile")
    }
}

struct SettingsSampleView: View {
    var body: some View {
        Text("Settings sample screen.")
            .navigationTitle("Settings")
    }
}

struct AboutSampleView: View {
    var body: some View {
        Text("About sample screen.")
            .navigationTitle("About")
    }
}

struct ExperimentsSampleView: View {
    var body: some View {
        Text("Experiments sample screen.")
            .navigationTitle("Experiments")
    }
}

#Preview {
    ContentView()
}
