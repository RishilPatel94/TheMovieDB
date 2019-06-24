//
//  MusicListCell.swift
//  TheMovieDB
//
//  Created by Rish on 6/23/19.
//  Copyright © 2019 Rishil. All rights reserved.
//

import UIKit
import Kingfisher
class MovieListCell: UITableViewCell {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblName : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
