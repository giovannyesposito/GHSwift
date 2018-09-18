//
//  HubersCell.swift
//  GHSwiftPullsSearch
//
//  Created by Giovanny Silva Esposito on 14/09/2018.
//  Copyright © 2018 Giovanny Silva Esposito. All rights reserved.
//

import UIKit

class HubersCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var repoLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
