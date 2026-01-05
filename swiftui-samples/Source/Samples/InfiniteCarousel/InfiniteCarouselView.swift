//
//  InfiniteCarouselView.swift
//  swiftui-samples
//
//  Created by pino on 05.01.26.
//

import SwiftUI

struct InfiniteCarouselView<Item, Content: View>: View {
    
    let items: [Item]
    let spacing: CGFloat?
    let content: (Item) -> Content

    @State private var currentIndex = 0
    @State private var scrollPosition: Int?

    init(items: [Item], spacing: CGFloat? = nil, @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        if items.isEmpty {
            preconditionFailure("Items should not be empty")
        } else {
            carouselBody
        }
    }

    private var baseScrollView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: spacing) {
                contentView(item: items[wrappedIndex(currentIndex - 1)], slotId: 0)
                contentView(item: items[wrappedIndex(currentIndex)], slotId: 1)
                contentView(item: items[wrappedIndex(currentIndex + 1)], slotId: 2)
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $scrollPosition)
        .onAppear {
            if scrollPosition == nil {
                jump(to: 1)
            }
        }
    }
    
    private func contentView(item: Item, slotId: Int) -> some View {
        content(item)
            .containerRelativeFrame(.horizontal)
            .id(slotId)
    }

    @ViewBuilder
    private var carouselBody: some View {
        baseScrollView
            .onScrollPhaseChange { _, newPhase in
                guard newPhase == .idle else { return }
                guard let currentPosition = scrollPosition else { return }
                handleSettled(at: currentPosition)
            }
    }

    private func handleSettled(at position: Int) {
        switch position {
        case 0:
            currentIndex = wrappedIndex(currentIndex - 1)
            jump(to: 1)
        case 2:
            currentIndex = wrappedIndex(currentIndex + 1)
            jump(to: 1)
        default:
            break
        }
    }

    private func wrappedIndex(_ index: Int) -> Int {
        let count = items.count
        let value = index % count
        let index = value >= 0 ? value : value + count
        return index
    }

    private func jump(to index: Int) {
        var transaction = Transaction()
        transaction.animation = nil
        withTransaction(transaction) {
            scrollPosition = index
        }
    }
}

