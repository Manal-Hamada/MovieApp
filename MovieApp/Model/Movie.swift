//
//  Movie.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 31/01/2024.
//

import Foundation

struct Movie:Decodable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language, original_title, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
   
  
}
