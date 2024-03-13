//
//  SecondCell.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 27/02/2024.
//

import UIKit


class FirstCell: UITableViewCell {

    @IBOutlet weak var movie_img: UIImageView!
    @IBOutlet weak var labels_container: UIView!

    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    
    @IBOutlet weak var movie_hours: UILabel!
    @IBOutlet weak var genres: UILabel!
    
    var didBackBtnPressesd:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        didBackBtnPressesd = {}
    }

    @IBAction func back(_ sender: Any) {
        (didBackBtnPressesd ?? {}
        )()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
         
    }
    
}
