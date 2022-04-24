//
//  Appetizer.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleApptezier = Appetizer(id: 0000,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy",
                                           price: 9.97,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemOne = Appetizer(id: 0001,
                                           name: "Order Item one",
                                           description: "This is the description for my appetizer. It's yummy",
                                           price: 9.97,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 0002,
                                           name: "Order Item two",
                                           description: "This is the description for my appetizer. It's yummy",
                                           price: 9.97,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemThree = Appetizer(id: 0003,
                                           name: "Order Item three",
                                           description: "This is the description for my appetizer. It's yummy",
                                           price: 9.97,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItems = [orderItemOne,orderItemTwo,orderItemThree]
}
