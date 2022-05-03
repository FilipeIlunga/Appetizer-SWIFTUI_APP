//
//  Order.swift
//  Appetizers
//
//  Created by DEV on 03/05/22.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    func totalPrice() -> Double {
        return items.reduce(0) { x, y in
                x + y.price
            }
    }
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
}
