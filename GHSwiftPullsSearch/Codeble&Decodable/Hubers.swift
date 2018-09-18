//
//  Hubers.swift
//  GHSwiftPullsSearch
//
//  Created by Giovanny Silva Esposito on 14/09/2018.
//  Copyright © 2018 Giovanny Silva Esposito. All rights reserved.
//

import UIKit

class ItemsJson: Codable {
    let items: [Item] 
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Item: Codable {
    
    let name, fullName: String
    let owner: Owner
    let description: String
    let fork: Bool
    let url, forksURL: String
    let archiveURL: String
    let pullsURL: String
    let stargazersCount: Int
    let forksCount: Int?
    let forks: Int?
    
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case fullName = "full_name"
        case owner
        case description, fork, url
        case forksURL = "forks_url"
        case archiveURL = "archive_url"
        case pullsURL = "pulls_url"
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case forks  = "forks"
    }
}

    enum DefaultBranch: String, Codable {
        case develop = "develop"
        case master = "master"
    }

    enum Language: String, Codable {
        case swift = "Swift"
    }

struct License: Codable {
    let key, name: String
    let spdxID: String?
    let url: String?
    let nodeID: String
        
        enum CodingKeys: String, CodingKey {
            case key, name
            case spdxID = "spdx_id"
            case url
            case nodeID = "node_id"
        }
    }

struct Owner: Codable {
    let avatarURL: String
    
        enum CodingKeys: String, CodingKey {
            case avatarURL = "avatar_url"
        }
    }

        enum TypeEnum: String, Codable {
            case organization = "Organization"
            case user = "User"
    }

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
