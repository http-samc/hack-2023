//
//  Sesh.swift
//  A4
//
//  Created by Samarth Chitgopekar on 12/1/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let netid: String
    let email: String
}

struct Sesh: Codable {
    let id: Int
    let title: String
    let course: String
    let startTime: String
    let endTime: String
    let location: String
    let description: String
    let population: Int
    let users: [User]
}
