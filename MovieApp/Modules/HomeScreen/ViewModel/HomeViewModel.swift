//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 12/02/2024.
//

import Foundation

protocol HomeViewModelProtocol {
    
    func loadTopRatedMovies()
}

class HomeViewModel : HomeViewModelProtocol {
    var networkManger:NetworkProtocol?
    var bindTopRatedToViewController :(()->()) = {}
    var bindPopularsToViewController :(()->()) = {}
    var bindupcomingToViewController :(()->()) = {}
    var bindPNowPlayingToViewController :(()->()) = {}
    private var topRatedMovies : [Movie]?
    private var popularMovies : [Movie]?
    private var upcomingMovies : [Movie]?
    private var nowPlayingMovies : [Movie]?
    
    init(networkManger: NetworkProtocol? ) {
        self.networkManger = networkManger
    }
    
    func loadTopRatedMovies() {
        networkManger?.fetchData(baseUrl: Movie_BASE_URL,endPoint: .topRated, compilitionHandler: { (response:HilightedMovieResponse?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.topRatedMovies = response?.results
            self.bindPopularsToViewController()
        })
    }
    func loadPopularMovies() {
        networkManger?.fetchData(baseUrl: Movie_BASE_URL,endPoint: .popular, compilitionHandler: { (response:HilightedMovieResponse?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.popularMovies = response?.results
            self.bindTopRatedToViewController()
        })
    }
    func loadNowPlayingMovies() {
        networkManger?.fetchData(baseUrl: Movie_BASE_URL,endPoint: .nowPlaying, compilitionHandler: { (response:HilightedMovieResponse?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.nowPlayingMovies = response?.results
            self.bindPNowPlayingToViewController()
        })
    }

    func loadUpcomingMovies() {
        networkManger?.fetchData(baseUrl: Movie_BASE_URL,endPoint: .upcoming, compilitionHandler: { (response:HilightedMovieResponse?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.upcomingMovies = response?.results
            self.bindupcomingToViewController()
        })
    }
    func getAMovie(index:Int,section:Int)-> Movie{
        switch(section){
        case 0:
            return topRatedMovies![index]
        case 1:
            return popularMovies![index]
        case 2:
            return upcomingMovies![index]
        default :
            return nowPlayingMovies![index]
        }
        
    }
    
    func getMoviesListCount(section:Int) -> Int{
        switch (section){
        case  SectionName.Top.rawValue:
            return topRatedMovies?.count ?? 0
        case SectionName.Popular.rawValue :
            return popularMovies?.count ?? 0
        case SectionName.Upcoming.rawValue :
            return upcomingMovies?.count ?? 0
        default:
            return nowPlayingMovies?.count ?? 0
        }
        
    }
}

enum SectionName :  Int{
    case Top
    case Popular
    case Upcoming
    case NowPlaying
   
}

