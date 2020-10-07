//
//  User.swift
//  GHFollowers
//
//  Created by Billy Pak on 10/1/20.
//

import Foundation

struct User: Codable {
    var login: String
    var avatar_url: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String 
}
