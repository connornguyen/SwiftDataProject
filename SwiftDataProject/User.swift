//
//  User.swift
//  SwiftDataProject
//
//  Created by Apple on 15/08/2024.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joindate: Date
    
    init(name: String, city: String, joindate: Date) {
        self.name = name
        self.city = city
        self.joindate = joindate
    }
}
