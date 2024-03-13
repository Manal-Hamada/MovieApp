//
//  ThirdCell.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 03/03/2024.
//

import UIKit

class SecondCell: UITableViewCell {

    
    @IBOutlet weak var more_btn: UIButton!
    
    @IBOutlet weak var movie_overView: UILabel!
    
    @IBOutlet weak var movie_title: UILabel!
    
    @IBOutlet weak var like_Label: UILabel!
    @IBOutlet weak var disLike_label: UILabel!
    
    var bindMoreAction : (()->()) = {}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func moreAction(_ sender: Any) {
        bindMoreAction()
    }
}
