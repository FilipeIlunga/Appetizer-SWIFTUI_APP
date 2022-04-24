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
    //MARK: - Network Alerts
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
    
    //MARK: - Account Alerts
    static let invalidForm: AlertItem = AlertItem(title: Text("Invalid Form"),
                                                       message: Text("Please ensure all fields in the form have been filled out."),
                                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail: AlertItem = AlertItem(title: Text("Invalid Email"),
                                                       message: Text("Please ensure your email is correct."),
                                                       dismissButton: .default(Text("OK")))
}
