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
    var bindMovieDetailsToViewController : (()->()) = {}
    static var movie:Movie?
    var images: [Image]?
    var details: MovieDetails?
    var cast: [Cast]?
    var videos : [video]?
    
    
    init(networkManager:NetworkProtocol){
        self.networkManager = networkManager
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
    func getAnActor(index:Int)->Cast?{
        return cast?[index]
    }
    static func getMovie()->Movie{
        return movie!     }
}
