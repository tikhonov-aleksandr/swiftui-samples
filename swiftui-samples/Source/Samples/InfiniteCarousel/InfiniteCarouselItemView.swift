//
//  InfiniteCarouselItemView.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

struct InfiniteCarouselItemView: View {
    
    let item: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.blue.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
            Text("Item \(item)")
                .font(.system(size: 34, weight: .semibold, design: .rounded))
                .foregroundStyle(.blue)
        }
    }
}


#Preview {
    InfiniteCarouselItemView(item: 5)
}
