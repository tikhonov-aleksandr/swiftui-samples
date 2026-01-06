//
//  InfiniteCarouselItem.swift
//  swiftui-samples
//
//  Created by pino on 06.01.26.
//

import Foundation
import Observation

@Observable
final class InfiniteCarouselItem: Identifiable {
    
    let name: String
    var value: Int
    
    var id: String { name }
    
    init(name: String, value: Int) {
        self.name = name
        self.value = value
    }
    
    static func data() -> [InfiniteCarouselItem] {
        (1...5).map { i in
            InfiniteCarouselItem(name: "\(i)", value: 0)
        }
    }
}
