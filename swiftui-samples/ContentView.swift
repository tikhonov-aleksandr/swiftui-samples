//
//  ContentView.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(SampleRoute.allCases) { route in
                NavigationLink(route.title, value: route)
            }
            .navigationTitle("Samples")
            .routeDestination()
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
