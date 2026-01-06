//
//  InfiniteCarouselSampleView.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

struct InfiniteCarouselSampleView: View {
    
    @State private var items = InfiniteCarouselItem.data()

    var body: some View {
        VStack(spacing: 20) {
            Text("Infinite Carousel")
                .font(.title2.weight(.semibold))
            Text("Swipe left or right")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            InfiniteCarouselView(items: items) { item in
                InfiniteCarouselItemView(item: item)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
            }
            .frame(height: 220)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 32)
        .background(Color.pink.opacity(0.1))
    }
}

#Preview {
    InfiniteCarouselSampleView()
}
