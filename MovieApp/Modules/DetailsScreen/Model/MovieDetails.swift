//
//  MovieDetails.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 29/02/2024.
//

import Foundation

struct MovieDetails: Decodable {
    var adult: Bool = false
    let backdrop_path: String?
    //    let budget: Int
    let genres: [Genre]
    //    let homepage: String
    //    let id: Int
    //    let imdbID, originalLanguage, originalTitle, overview: String
    //    let popularity: Double
    //    let posterPath: String
    //    let productionCompanies: [ProductionCompany]
    //    let productionCountries: [ProductionCountry]
          var release_date: String = ""
          let revenue, runtime: Int
    //    let spokenLanguages: [SpokenLanguage]
      //    let status, tagline, title: String
          var title :String = ""
    //    let video: Bool
          let vote_average: Double
          var vote_count: Int = 0
    
    //   enum CodingKeys: String,Codable,CodingKey {
    //        case adult
    //        case backdropPath = "backdrop_path"
    //        case belongsToCollection = "belongs_to_collection"
    //        case budget, genres, homepage, id
    //        case imdbID = "imdb_id"
    //        case originalLanguage = "original_language"
    //        case originalTitle = "original_title"
    //        case overview, popularity
    //        case posterPath = "poster_path"
    //        case productionCompanies = "production_companies"
    //        case productionCountries = "production_countries"
    //        case releaseDate = "release_date"
    //        case revenue, runtime
    //        case spokenLanguages = "spoken_languages"
    //        case status, tagline, title, video
    //        case voteAverage = "vote_average"
    //        case voteCount = "vote_count"
    //   }
    init(backdrop_path: String?, genres: [Genre], revenue: Int, runtime: Int,voteAverage:Double) {
        self.backdrop_path = backdrop_path
        self.genres = genres
        self.revenue = revenue
        self.runtime = runtime
        self.vote_average = voteAverage
    }
    
    struct ProductionCompany: Decodable {
        let id: Int
        let logoPath: String?
        let name, originCountry: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case logoPath = "logo_path"
            case name
            case originCountry = "origin_country"
        }
    }
    
    struct ProductionCountry: Decodable {
        let iso3166_1, name: String
        
        enum CodingKeys: String, CodingKey {
            case iso3166_1 = "iso_3166_1"
            case name
        }
    }
    
    struct SpokenLanguage: Decodable {
        let englishName, iso639_1, name: String
        
        enum CodingKeys: String, CodingKey {
            case englishName = "english_name"
            case iso639_1 = "iso_639_1"
            case name
        }
    }
    
    
    
    //struct MovieDetails : Decodable {
    //    let adult: Bool
    //    let backdrop_path: String
    //    let budget: Int
    //    let genres: [Genre]
    //    let homepage: String
    //    let id: Int
    //    let imdb_id, original_language, original_title, overview: String
    //    let popularity: Double
    //    let poster_path: String
    //    let production_companies: [ProductionCompany]
    //    let production_countries: [ProductionCountry]
    //    let release_date: String
    //    let revenue, runtime: Int
    //    let spoken_languages: [SpokenLanguage]
    //    let status, tagline, title: String
    //    let video: Bool
    //    let vote_average: Double
    //    let vote_count: Int
    //}
    //
    //struct ProductionCompany : Decodable {
    //    let id: Int
    //    let logo_path, name, origin_country: String
    //}
    //
    //struct ProductionCountry :Decodable{
    //    let iso3166_1, name: String
    //}
    //
    //struct SpokenLanguage : Decodable{
    //    let english_name, iso639_1, name: String
    //}
}
