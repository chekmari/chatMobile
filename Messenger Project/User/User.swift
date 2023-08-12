//
//  User.swift
//  Messenger Project
//
//  Created by macbook on 06.08.2023.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
    var firstName: String
    var middleName: String
    var lastName: String
    var age: String?
    var country: String?
    var town: String?
}


