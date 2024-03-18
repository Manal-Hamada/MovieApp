//
//  Utilities.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 30/01/2024.
//

import Foundation

let API_KEY = "api_key=3f171a7e8da39feeb9f7db4c8448ae26"
let Movie_BASE_URL = "https://api.themoviedb.org/3/movie/"
let Movie_SEARCH_BASE_URL = "https://api.themoviedb.org/3/search/movie"
let GENRE_BASE_URL = "https://api.themoviedb.org/3/genre/movie/"
let SEARCH_BASE_URL = "https://api.themoviedb.org/3/"
let imgHeader = "https://image.tmdb.org/t/p/w500"
let YOUTUBE_VIDEO_HEADER = "https://www.youtube.com/watch?v="

enum EndPoints{
    case topRated
    case upcoming
    case popular
    case nowPlaying
    case Ggenrues
    case videos(movieId:Int)
    case cast(movieId:Int)
    case movie_details(movieId:Int)
    case images(movieId:Int)
    case search(listId:Int)
    case searchByName(name:String)
    case searchforActorName(name:String)
    
    var path:String{
        
        switch self{
        case .nowPlaying :
            return "now_playing?"
        case .topRated :
            return "top_rated?"
        case .popular:
            return "popular?"
        case .upcoming :
            return "upcoming?"
        case .Ggenrues :
            return "list"
        case .images(movieId: let movieId):
            return "\(movieId)/images?"
        case .cast(movieId: let movieId):
            return "\(movieId)/credits?"
        case .search(listId: let listId):
            return "list/\(listId)"
        case .searchByName(name: let name):
            return "?query=\(name)&"
        case .searchforActorName(name: let name):
            return "?query=\(name)&"
        case .movie_details(movieId: let movieId):
            return "\(movieId)?"
        case .videos(movieId: let movieId):
            return "\(movieId)/videos?"
        }
        }
    }

enum Tags{
    // case search(listId:Int)
    case movie
    var path:String{
        
        switch self{
            
        case .movie :
            return "movie/"
            //        case .search(listId: let listId):
            //            return "list/\(listId)"
            //        }
        }
    }
}
