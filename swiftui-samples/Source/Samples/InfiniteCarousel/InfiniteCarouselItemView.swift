//
//  InfiniteCarouselItemView.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI
import Observation

struct InfiniteCarouselItemView: View {
    
    @Bindable var item: InfiniteCarouselItem
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.blue.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
            
            VStack(alignment: .center) {
                Text("Item: \(item.name)")
                HStack(spacing: 16) {
                    Button("-") {
                        item.value -= 1
                    }
                    Text("Value: \(item.value)")
                    Button("+") {
                        item.value += 1
                    }
                }
            }
            .font(.system(size: 34, weight: .semibold, design: .rounded))
            .foregroundStyle(.blue)
        }
    }
}


#Preview {
    InfiniteCarouselItemView(item: .init(name: "Item 1", value: 2))
}
