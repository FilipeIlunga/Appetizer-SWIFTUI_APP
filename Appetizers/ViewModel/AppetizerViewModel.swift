//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import Foundation
import SwiftUI

class AppetizerViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizer() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                case .success(let appetizers):
                    self.appetizers = appetizers
                }
            }
        }
    }
}
