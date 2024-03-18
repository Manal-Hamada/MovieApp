//
//  SecondCell.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 27/02/2024.
//

import UIKit
import youtube_ios_player_helper


class FirstCell: UITableViewCell,YTPlayerViewDelegate {

    @IBOutlet weak var movie_img: UIImageView!
    @IBOutlet weak var labels_container: UIView!

    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var watchTrailer: UIButton!
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var watchMovie: UIButton!
    
    @IBOutlet weak var movie_hours: UILabel!
    @IBOutlet weak var genres: UILabel!
    
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    var didBackBtnPressesd:(()->())?
    var didWatchTrailerBtnPressesd:(()->())?
    var didWatchMovieBtnPressesd:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        didBackBtnPressesd = {}
        videoPlayer.delegate = self
            }

    @IBAction func back(_ sender: Any) {
        (didBackBtnPressesd ?? {}
        )()
    }
    
    @IBAction func watchTrailerAction(_ sender: Any) {
        (didWatchTrailerBtnPressesd ?? {})()
    }
    
    @IBAction func watchMovieAction(_ sender: Any) {
        (didWatchMovieBtnPressesd ?? {})()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
         
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        videoPlayer.playVideo()
    }
}
