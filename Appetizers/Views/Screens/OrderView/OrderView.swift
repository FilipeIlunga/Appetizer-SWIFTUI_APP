//
//  OrderView.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem)
                        }
                    }
                    .listStyle(.insetGrouped)
                    
                    Button {
                        print("Order placed")

                    } label: {
                        APButton(title: "$\(order.totalPrice) - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                if order.items.isEmpty {
                     EmptyStateView(imageName: "orderEmptyState", message: "You have no items on yor order.")
                 }
            }
            .navigationTitle("Order")
        }
    }
    
struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
