//
//  Order.swift
//  Appetizers
//
//  Created by DEV on 03/05/22.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        get {
            return items.reduce(0) { $0 + $1.price }
        }

    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
