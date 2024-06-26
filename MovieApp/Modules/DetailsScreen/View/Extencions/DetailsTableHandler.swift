//
//  DetailsTableHandler.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 27/02/2024.
//

import Foundation
import UIKit
extension DetailsViewController :UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        switch (indexPath.row){
           case 0 :
              return selectCell(cellNum: 0, tableView: tableView)
        default :
            return selectCell(cellNum: 1, tableView: tableView)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0 :
            return CGFloat(floatLiteral: UIScreen.main.bounds.size.height * 0.5)
        default:
            return CGFloat(floatLiteral: UIScreen.main.bounds.size.height * 0.3)
        }
    }

    func calcMovieTime(runTime:Int)->(hours:Int,minutes:Int){
        let hours : Int = runTime / 60
        let minutes:Int = runTime - (hours*60)
        return (hours,minutes)
    }
    
    func getMovieGenres()->Array<String>{
        var arr :Array<String> = []
        var i = 0
        let genres = detailsViewModel?.getDetails()
        while (i < genres?.genres.count ?? 0){
            arr.append(genres?.genres[i].name ?? "")
            i+=1
        }
       return arr
    }
    
    func setGenresLabelData(label:UILabel){
         var i = 0
         let arr = getMovieGenres()
        label.text = ""
        while (i < arr.count){
            if(i > 0){
                label.text?.append(" . ")
            }
            label.text?.append("\(arr[i])")
            i+=1
        }
    }

    func selectCell(cellNum:Int,tableView:UITableView)->UITableViewCell{
        var cell:UITableViewCell?
        switch (cellNum){
        case 0 :
            cell = tableView.dequeueReusableCell(withIdentifier: "first_cell") as? FirstCell
            setFirstCellData(cell: cell as! FirstCell)
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "second_cell") as? SecondCell
            setSecondCellData(cell: cell as! SecondCell)
        }
        return cell ?? UITableViewCell()
    }
    
    func setSecondCellData(cell:SecondCell){
        let movie = DetailsViewModel.getMovie()
       cell.movie_title.text = movie.original_title
        cell.like_Label.text = "\(calcVotes().likes)k"
        cell.disLike_label
            .text = "\(calcVotes().disLikes)k"
        displayMovieOverView(cell: cell)
        cell.bindMoreAction = {
            self.moreBtnFlag = true
          //  self.myTable.reloadData()
        }
    }
    
    func displayMovieOverView(cell:SecondCell){
        let movie = DetailsViewModel.getMovie()
        var arr = movie.overview?.components(separatedBy: ",")
        cell.movie_overView.text = movie.overview
//        if(isMoreBtn(cell: cell)){
//            cell.movie_overView.text = "\(String(describing: arr?[0])),\(String(describing: arr?[1]))))"
//        }
//        else{
//            var i = 0
//            cell.movie_overView.text = ""
//            while(i<arr?.count ?? 0){
//                cell.movie_overView.text! += "\(arr?[i])"
//            }
//        }
    }
    func isMoreBtn(cell:SecondCell)->Bool{
        if(moreBtnFlag ?? false){
            cell.more_btn.titleLabel?.text = "Less"
           // cell.more_btn.titleLabel?.numberOfLines = 0
            return true
        }
        cell.more_btn.titleLabel?.text = "More"
       // cell.more_btn.titleLabel?.numberOfLines = 2
        return false
    }
    func setFirstCellData(cell:FirstCell){
        setMoviImg(cell: cell)
        let time = calcMovieTime(runTime: detailsViewModel?.details?.runtime ?? 0)
        cell.movie_hours.text = "\(time.hours)h \(time.minutes)m"
        setGenresLabelData(label: cell.genres)
        setContainerLabels(cell: cell)
        cell.labels_container.layer.cornerRadius = 15
    }
    
    func setContainerLabels(cell:FirstCell){
        cell.rating.text = "\( detailsViewModel?.getDetails().vote_average.roundTo1f() ?? "@")"
        var releasedDate = detailsViewModel?.getDetails().release_date.components(separatedBy: "-")
        cell.year.text = releasedDate?[0]
        if(isForAdult()){
            cell.age.text = "+18"
        }
        else {
            cell.age.text = "+12"
        }
    }
    
    func setMoviImg(cell:FirstCell){
        let filePath : String = detailsViewModel?.details?.backdrop_path ?? ""
        let imgUrl = URL(string: "\(imgHeader)\(filePath)")
        print("/n\(imgHeader)\(filePath)")
        cell.movie_img.kf.setImage(with: imgUrl,placeholder: UIImage(named: "movie_placeholder"))
        cell.didBackBtnPressesd = {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    func isForAdult()->Bool{
        if(detailsViewModel?.getDetails().adult == false){
            return false
        }
        return true
    }
    
    func calcVotes()->(likes:NSString,disLikes:NSString){
        let voteCount :Int = detailsViewModel?.getDetails().vote_count ?? 0
        let voteAverage :Double = detailsViewModel?.getDetails().vote_average ?? 0.0 / 10
        let likes = (Double(voteCount) * voteAverage / 1000).roundTo1f()
        let disLikes = ((Double(voteCount) - (Double(voteCount) * voteAverage / 1000)) / 1000) .roundTo1f()
        return (likes,disLikes)
    }
}
