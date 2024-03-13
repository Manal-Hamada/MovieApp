//
//  Person.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 21/02/2024.
//

import Foundation

struct Person: Codable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment, name, originalName: String
    let popularity: Double
    let profilePath: String
    let knownFor: [KnownFor]

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}
struct KnownFor: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title, originalLanguage, originalTitle, overview: String
    let posterPath, mediaType: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
