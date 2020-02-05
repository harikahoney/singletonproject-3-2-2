//
//  photosFile.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 31, 2020

import Foundation

struct photos : Codable {

        let albumId : Int
        let id : Int
        let thumbnailUrl : String
        let title : String
        let url : String

        enum CodingKeys: String, CodingKey {
                case albumId = "albumId"
                case id = "id"
                case thumbnailUrl = "thumbnailUrl"
                case title = "title"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
            albumId = try values.decodeIfPresent(Int.self, forKey: .albumId)!
            id = try values.decodeIfPresent(Int.self, forKey: .id)!
            thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)!
            title = try values.decodeIfPresent(String.self, forKey: .title)!
            url = try values.decodeIfPresent(String.self, forKey: .url)!
        }

}
