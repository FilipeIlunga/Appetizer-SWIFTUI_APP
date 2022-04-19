//
//  APError.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "There was an issue connecting to the server. If this persists, please contact support."
        case .invalidResponse:
            return "Invalid response from the server. Please try again later or contact support."
        case .invalidData:
            return "The data received from the server was invalid. Please contact support."
        case .unableToComplete:
            return "Unable to complete your request at this time. Please ceck your internet connection."
        }
    }
}
