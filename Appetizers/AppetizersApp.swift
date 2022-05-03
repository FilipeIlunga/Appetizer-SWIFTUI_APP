//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
