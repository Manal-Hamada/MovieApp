//
//  VideosResponse.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 21/02/2024.
//

import Foundation
struct VideosResponse: Decodable {
    let id: Int
    let results: [video]
}

struct video: Decodable {
    let iso639_1: ISO639_1
    let iso3166_1: ISO3166_1
    let name, key: String
    let site: Site
    let size: Int
    let type: TypeEnum
    let official: Bool
    let publishedAt, id: String

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "language"
        case iso3166_1 = "state"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}

enum ISO3166_1: String, Decodable {
    case us = "US"
}

enum ISO639_1: String, Decodable {
    case en = "en"
}

enum Site: String, Codable {
    case youTube = "YouTube"
}

enum TypeEnum: String, Codable {
    case clip = "Clip"
    case featurette = "Featurette"
    case teaser = "Teaser"
    case trailer = "Trailer"
}
