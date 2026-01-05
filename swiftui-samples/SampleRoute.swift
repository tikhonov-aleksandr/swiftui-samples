//
//  SampleRoute.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

enum SampleRoute: String, CaseIterable, Identifiable {
    case profile
    case settings
    case about
    case experiments

    var id: String { rawValue }

    var title: String {
        switch self {
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        case .about:
            return "About"
        case .experiments:
            return "Experiments"
        }
    }
}

extension View {
    func routeDestination() -> some View {
        navigationDestination(for: SampleRoute.self) { route in
            switch route {
            case .profile:
                ProfileSampleView()
            case .settings:
                SettingsSampleView()
            case .about:
                AboutSampleView()
            case .experiments:
                ExperimentsSampleView()
            }
        }
    }
}
