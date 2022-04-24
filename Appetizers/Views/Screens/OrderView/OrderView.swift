//
//  OrderView.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete { indexSet in
                        orderItems.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.insetGrouped)
                
                Button {
                    print("Order placed")
                } label: {
                    APButton(title: "$99.99 - Place Order")
                }
                .padding(.bottom, 25)
            }
            .navigationTitle("Order")
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
