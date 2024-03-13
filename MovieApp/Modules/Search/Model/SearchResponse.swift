//
//  SearchResponse.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 11/02/2024.
//

import Foundation

struct Searchresponse: Decodable {
    let createdBy, description: String
    let favoriteCount, id: Int
    let iso639_1: Language
    let itemCount: Int
    let items: [Movie]
    let name: String
    let page: Int
    let posterPath: String
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case createdBy = "created_by"
        case description
        case favoriteCount = "favorite_count"
        case id
        case iso639_1 = "iso_639_1"
        case itemCount = "item_count"
        case items, name, page
        case posterPath = "poster_path"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

enum Language: String, Decodable {
    case en = "en"
    case fr = "fr"
}

