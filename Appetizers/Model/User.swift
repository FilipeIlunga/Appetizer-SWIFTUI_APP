//
//  User.swift
//  Appetizers
//
//  Created by DEV on 24/04/22.
//

import Foundation

struct User: Codable {
    var extraNapkins: Bool = true
    var frequentRefills: Bool = false
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday: Date = Date()
}
