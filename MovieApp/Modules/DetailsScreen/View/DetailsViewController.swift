//
//  MovieDetailsViewControllers.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 26/02/2024.
//

import Foundation
import UIKit
import Kingfisher


class DetailsViewController:UIViewController{
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var myTable: UITableView!
    var moreBtnFlag : Bool?
    var networkManager:NetworkManager?
    var detailsViewModel:DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager = NetworkManager()
        detailsViewModel = DetailsViewModel(networkManager: networkManager!)
        moreBtnFlag = false
        myTable.contentInsetAdjustmentBehavior = .never
        self.navigationController?.navigationBar.isHidden = true
        registerCells()
        bindDetails(movie: DetailsViewModel.getMovie())
        bindVideos(movie: DetailsViewModel.getMovie())
        //detailsViewModel?.loadVideos(movie: DetailsViewModel.getMovie())
    }

    func bincast(){
        detailsViewModel?.fetchCrew(moviId:DetailsViewModel.getMovie().id ?? 0 )
        detailsViewModel?.bindCastToViewController = {[weak self] in
            DispatchQueue.main.async {
                print("\(String(describing: self?.detailsViewModel?.getAnActor(index: 0)?.name))")
            }
        }
    }
    func bindVideos(movie:Movie){
        detailsViewModel?.loadVideos(movie: movie)
        detailsViewModel?.bindMovieVideosToViewController = {
            [weak self] in DispatchQueue.main.async {
                self?.detailsViewModel?.searchForTrailers(response:self?.detailsViewModel?.getVideos() ?? [] )
                print("trailers count = \( self?.detailsViewModel?.trailers?.count ?? 0) ")
            }
        }
    }
    
    func bindDetails(movie:Movie){
        detailsViewModel?.loadMovieDetails(movie: movie)
        detailsViewModel?.bindMovieDetailsToViewController = {
            [weak self] in DispatchQueue.main.async {
                self?.indicator.stopAnimating()
                self?.myTable.reloadData()
            }
        }
    }
//    func bindImages(){
//        detailsViewModel?.loadImages(movie: DetailsViewModel.getMovie())
//        detailsViewModel?.bindImagesToViewController = {
//            [weak self] in DispatchQueue.main.async {
//                self?.indicator.stopAnimating()
//                self?.myTable.reloadData()
//            }
//        }
//    }
    func registerCells(){
        myTable.register(UINib(nibName: "FirstCell", bundle: nil), forCellReuseIdentifier: "first_cell")
        myTable.register(UINib(nibName: "SecondCell", bundle: nil), forCellReuseIdentifier: "second_cell")
    }
    
  
}
