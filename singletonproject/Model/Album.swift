//
//  Album.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 31, 2020

import Foundation

struct Album : Codable {

        let id : Int
        let title : String
        let userId : Int

        enum CodingKeys: String, CodingKey {
                case id = "id"
                case title = "title"
                case userId = "userId"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(Int.self, forKey: .id)!
                title = try values.decodeIfPresent(String.self, forKey: .title)!
                userId = try values.decodeIfPresent(Int.self, forKey: .userId)!
        }

}
