//
//  HomeViewController.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 11/02/2024.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var homeViewModel : HomeViewModel?
    var networkManager:NetworkManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager = NetworkManager()
        homeViewModel = HomeViewModel(networkManger: networkManager)
        setLayout()
        bindTopoRatedMovies()
        bindPopularMovies()
        bindNowPlayingMovies()
        bindUpcomingMovies()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func bindPopularMovies(){
        homeViewModel?.loadPopularMovies()
        homeViewModel?.bindPopularsToViewController = { [weak self]
            in DispatchQueue.main.async {
                self?.myCollection.reloadData()
            }
            
        }
    }
    func bindUpcomingMovies(){
        homeViewModel?.loadUpcomingMovies()
        homeViewModel?.bindupcomingToViewController = { [weak self]
            in DispatchQueue.main.async {
                self?.myCollection.reloadData()
            }
            
        }
    }
    func bindNowPlayingMovies(){
        homeViewModel?.loadNowPlayingMovies()
        homeViewModel?.bindPNowPlayingToViewController = { [weak self]
            in DispatchQueue.main.async {
                self?.myCollection.reloadData()
            }
        }
    }
    func bindTopoRatedMovies(){
        homeViewModel?.loadTopRatedMovies()
        homeViewModel?.bindTopRatedToViewController = { [weak self]
            in DispatchQueue.main.async {
                self?.myCollection.reloadData()
                self?.indicator.stopAnimating()
            }
            
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel?.getMoviesListCount(section: section ) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = getdisplayedListBegineing(section: indexPath.section, indexPath: indexPath)
        let movie = (homeViewModel?.getAMovie(index: index, section: indexPath.section))!
        goToDetailsScreen(movie: movie)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch(indexPath.section){
        case 0 :
            return setCellData(section: 0, indexPath: indexPath)
        case 1:
            return setCellData(section: 1, indexPath: indexPath)
        case 2:
            return setCellData(section: 2, indexPath: indexPath)
        default :
            return setCellData(section: 3, indexPath: indexPath)
        }
        
    }
    
    func setCellData(section:Int,indexPath:IndexPath)->HomeCell{
        var index = getdisplayedListBegineing(section: section, indexPath: indexPath)
        let myMovie = homeViewModel?.getAMovie(index: index, section: section)
        let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "top_rated_cell", for: indexPath) as? HomeCell
        setCellShape(cell: cell ?? HomeCell())
        let imgUrl = URL(string: "\(imgHeader)\(myMovie?.poster_path ?? "")")
        cell?.home_movie_image.kf.indicatorType = .activity
        cell?.home_movie_image.kf.setImage(with: imgUrl,placeholder:  UIImage(named: "movie_placeholder"))
        
        return cell ?? HomeCell()
    }
    
    func getdisplayedListBegineing(section:Int,indexPath:IndexPath)->Int{
        if(section > 1){
            return ((homeViewModel?.getMoviesListCount(section: section) ?? 0) -  1) - indexPath.row
        }
        return indexPath.row
    }
    
    func setCellShape(cell:HomeCell){
        cell.contentView.layer.cornerRadius = 20.0
        cell.layer.shadowColor = UIColor.black.cgColor;
        cell.layer.shadowOffset = CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 8.0;
        cell.layer.shadowOpacity = 0.5;
        cell.layer.masksToBounds = false;
    }
    func goToDetailsScreen(movie:Movie) {
        let detailsScreen : DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "details_view_controller") as! DetailsViewController
        DetailsViewModel.movie = movie
        self.navigationController?.pushViewController(detailsScreen, animated: true)
        
    }
}

