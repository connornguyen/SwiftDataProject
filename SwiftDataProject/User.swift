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
    var joinDate: Date
    //This change the delete relationship between jobs and User, meaning when delete a User, it deletes jobs too
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
