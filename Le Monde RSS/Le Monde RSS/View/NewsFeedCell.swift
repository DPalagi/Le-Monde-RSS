//
//  NewsFeedCell.swift
//  Le Monde RSS
//
//  Created by dpalagi on 27/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!

    // MARK: - Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
