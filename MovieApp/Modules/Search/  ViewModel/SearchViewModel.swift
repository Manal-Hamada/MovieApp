//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 30/01/2024.
//

import Foundation

protocol SearchViewModelProtocol{
    func loadData()
}

class SearchViewModel:SearchViewModelProtocol{
    var networkManger:NetworkProtocol?
    var bindDataToViewController :(()->()) = {}
    var bindGenresToViewController :(()->()) = {}
    var bindSearchResultToViewController :(()->()) = {}
    var movies:[Movie]?
    var searchedMovies:[Movie]?
    var genres:[Genre]?
    var movieImages:[Image]?
    
    init(networkManger: NetworkProtocol? ) {
        self.networkManger = networkManger
    }
    
    func loadData() {
        networkManger?.fetchData(baseUrl: Movie_BASE_URL,endPoint: .nowPlaying, compilitionHandler: { (response:HilightedMovieResponse?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.movies = response?.results
            self.bindDataToViewController()
        })
    }
    
    func loadGenres(){
        networkManger?.fetchData(baseUrl: GENRE_BASE_URL, endPoint: .Ggenrues, compilitionHandler: {(response:GenreResponse?) in
            guard response != nil else{
                print("No Genres Response")
                return
            }
            self.genres = response?.genres
            self.bindGenresToViewController()
        })
    }
    
    func searchByName(movieName:String){
        networkManger?.fetchData(baseUrl: Movie_SEARCH_BASE_URL, endPoint: .searchByName(name: movieName), compilitionHandler: {(response:HilightedMovieResponse?) in
            guard response != nil else{
                print("No search Response")
                return
            }
            self.searchedMovies = response?.results
            self.bindSearchResultToViewController()
        })
    }
    
    func getSearchedMovies()-> [Movie]{
        return searchedMovies ?? []
    }
   func getASearchedMovie(index:Int)-> Movie{
        return searchedMovies![index]
    }
    func getSearchedListCount() -> Int{
        return searchedMovies?.count ?? 0
    }
    func getGenres()-> [Genre]{
        return genres ?? []
    }
    func getAGenre(index:Int)-> Genre{
        return genres![index]
    }
    func getGenresListCount() -> Int{
        return genres?.count ?? 0
    }
    
}
