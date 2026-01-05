//
//  InfiniteCarouselItemView.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

struct InfiniteCarouselItemView: View {
    
    let item: Int
    @Binding var value: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.blue.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text("Item \(item)")
                HStack(spacing: 16) {
                    Button("-") {
                        value -= 1
                    }
                    Text("Value \(value)")
                    Button("+") {
                        value += 1
                    }
                }
            }
            .font(.system(size: 34, weight: .semibold, design: .rounded))
            .foregroundStyle(.blue)
        }
    }
}


#Preview {
    InfiniteCarouselItemView(item: 5, value: .constant(0))
}
