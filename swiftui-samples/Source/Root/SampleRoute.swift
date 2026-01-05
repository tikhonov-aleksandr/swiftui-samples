//
//  SampleRoute.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

enum SampleRoute: String, CaseIterable, Identifiable {
    case infiniteCarousel

    var id: String { rawValue }

    var title: String {
        switch self {
        case .infiniteCarousel:
            return "Infinite Carousel"
        }
    }
}

extension View {
    func routeDestination() -> some View {
        navigationDestination(for: SampleRoute.self) { route in
            switch route {
            case .infiniteCarousel:
                InfiniteCarouselSampleView()
            }
        }
    }
}
