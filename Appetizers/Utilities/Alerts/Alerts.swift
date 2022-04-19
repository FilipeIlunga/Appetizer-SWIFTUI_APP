//
//  Alerts.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id:UUID = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData: AlertItem = AlertItem(title: Text("Server Error"),
                                                  message: Text(APError.invalidData.localizedDescription),
                                                  dismissButton: .default(Text("OK")))
    
    static let invalidResponse: AlertItem = AlertItem(title: Text("Server Error"),
                                                      message: Text(APError.invalidResponse.localizedDescription),
                                                      dismissButton: .default(Text("OK")))
    
    static let invalidURL: AlertItem = AlertItem(title: Text("Server Error"),
                                                 message: Text(APError.invalidURL.localizedDescription),
                                                 dismissButton: .default(Text("OK")))
    
    static let unableToComplete: AlertItem = AlertItem(title: Text("Server Error"),
                                                       message: Text(APError.unableToComplete.localizedDescription),
                                                       dismissButton: .default(Text("OK")))
}
