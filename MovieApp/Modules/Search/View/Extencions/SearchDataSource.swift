//
//  HomeScreenExc2.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 07/02/2024.
//

import Foundation
import UIKit
import Kingfisher
extension SearchScreen :UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(searchViewModel?.getSearchedListCount() ?? 0 == 0){
            self.searchImage.isHidden = false
        }
        else{
            self.searchImage.isHidden = true
        }
            return searchViewModel?.getSearchedListCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            return setCellData(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = (searchViewModel?.searchedMovies?[indexPath.row]) else { return  }
        goToDetailsScreen(movie: movie)
    }
    func setCellData(indexPath:IndexPath)->CustomeCollectionViewCell{
        let cell :CustomeCollectionViewCell = createCell(cellId: "custom_cell", indexPath: indexPath,collectionView: myCollectionview) as! CustomeCollectionViewCell
        let imgUrl = URL(string: "\(imgHeader)\(searchViewModel?.getASearchedMovie(index: indexPath.row).poster_path ?? "")")
        cell.movie_image.kf.indicatorType = .activity
        cell.movie_image.kf.setImage(with: imgUrl,placeholder:  UIImage(named: "movie_placeholder"))
        return cell
    }
    
    func createCell(cellId:String,indexPath:IndexPath,collectionView:UICollectionView)->UICollectionViewCell{
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    func goToDetailsScreen(movie:Movie) {
        let detailsScreen : DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "details_view_controller") as! DetailsViewController
        DetailsViewModel.movie = movie
        self.navigationController?.pushViewController(detailsScreen, animated: true)
        
    }
    
//    func setSegCell(indexPath:IndexPath)->CustomSegmantCell{
//        let cell : CustomSegmantCell = createCell(cellId: "segCell", indexPath: indexPath,collectionView: segmantsCollectionView) as! CustomSegmantCell
//        if(indexPath.row == 0){
//            cell.isSelected = true
//            cell.contentView.layer.backgroundColor = UIColor(named: "segColor1")?.cgColor
//            cell.segmantLabel.textColor = .white
//        }
//        cell.segmantLabel.text = searchViewModel?.getAGenre(index:indexPath.row).name
//        cell.contentView.layer.borderWidth = 0.5
//        cell.contentView.layer.borderColor = UIColor.black.cgColor
//        cell.contentView.layer.cornerRadius = 15
//
//        return cell
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if(collectionView == segmantsCollectionView){
//            let cell : CustomSegmantCell = collectionView.cellForItem(at: indexPath) as! CustomSegmantCell
//            deselectCell(collectionView: collectionView, row: 0, section: 0)
//            cell.contentView.backgroundColor = UIColor(named: "segColor1")
//            cell.segmantLabel.textColor = UIColor(named: "white")
//
//        }
//    }
    
//    func deselectCell(collectionView:UICollectionView,row:Int,section:Int){
//        let cell : CustomSegmantCell = collectionView.cellForItem(at:  IndexPath(row: row, section: section)) as! CustomSegmantCell
//        cell.isSelected = false
//        cell.contentView.layer.backgroundColor = UIColor(named: "bg")?.cgColor
//        cell.segmantLabel.textColor = UIColor(named: "segColor1")
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if(collectionView == segmantsCollectionView){
//            let cell : CustomSegmantCell = collectionView.cellForItem(at: indexPath) as! CustomSegmantCell
//            cell.contentView.backgroundColor = UIColor(named: "bg")
//            cell.segmantLabel.textColor = UIColor(named: "segColor1")
//        }
//    }
}
