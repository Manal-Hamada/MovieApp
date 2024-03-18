//
//  DetailsViewModel.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 21/02/2024.
//

import Foundation
import AVFoundation
import CardSlider

class DetailsViewModel{
    var networkManager : NetworkProtocol?
    var personData : [Person]?
    var bindImagesToViewController : (()->()) = {}
    var bindCastToViewController : (()->()) = {}
    var bindMovieVideosToViewController : (()->()) = {}
    var bindMovieDetailsToViewController : (()->()) = {}
    static var movie:Movie?
    var images: [Image]?
    var details: MovieDetails?
    var cast: [Cast]?
    var videos : [Video]?
    var trailers :[Video]?
    
    init(networkManager:NetworkProtocol){
        self.networkManager = networkManager
        trailers = []
    }
    
    func loadImages(movie:Movie){
        networkManager?.fetchData(baseUrl: Movie_BASE_URL, endPoint: .images(movieId: movie.id ?? 0 ),compilitionHandler: { (response:ImagesResponse?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.images = response?.posters
            print("images loaded\n")
            self.bindImagesToViewController()
        })
    }
    func loadMovieDetails(movie:Movie){
        networkManager?.fetchData(baseUrl: Movie_BASE_URL, endPoint:.movie_details(movieId: movie.id ?? 0) , compilitionHandler: {
            (response:MovieDetails?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.details = response
            print("Movie Details loaded\n")
            self.bindMovieDetailsToViewController()
        })
    }
    func loadVideos(movie:Movie){
        networkManager?.fetchData(baseUrl: Movie_BASE_URL, endPoint: .videos(movieId: movie.id ?? 0), compilitionHandler:{ (response:VideosResponse?)in
            guard response != nil else{
                print("No Response")
                return
            }
            self.videos = response?.results
            print("Movie videos loaded\n")
           // self.searchForTrailers(response: response?.results ?? [])
            self.bindMovieVideosToViewController()
            print("videos count = \(self.videos?.count ?? 0)")
        })
    }
    func fetchCrew(moviId:Int){
        networkManager?.fetchData(baseUrl: Movie_BASE_URL, endPoint: .cast(movieId: moviId), compilitionHandler: {(response:castResponse?) in
            guard response != nil else{
                print("No Response")
                return
            }
            self.cast = response?.cast
            self.bindCastToViewController()
        })
    }
    func searchForTrailers(response:[Video]){
        
        var i = 0
        while(i < response.count){
            if(response[i].type == .trailer){
                trailers?.append(response[i])
            }
            i+=1
        }
    }
    
    func getDetails()-> MovieDetails{
        return details ?? MovieDetails(backdrop_path: "", genres: [], revenue: 0, runtime: 0,voteAverage: 0.0)
    }
    func getImagesCount()->Int{
        return images?.count ?? 0
    }
    func getAnImage(index:Int)->Image?{
        return images?[index]
    }
    func getCastCount()->Int{
        return cast?.count ?? 0
    }
    func getVideos()->[Video]{
        return videos ?? []
    }
    func getAnActor(index:Int)->Cast?{
        return cast?[index]
    }
    func getMovieTrailers()->[Video]{
        return trailers ?? []
    }
    static func getMovie()->Movie{
        return movie!     }
}
