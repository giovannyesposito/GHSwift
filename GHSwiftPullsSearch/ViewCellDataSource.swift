//
//  ViewCellDataSource.swift
//  GHSwiftPullsSearch
//
//  Created by Giovanny Silva Esposito on 27/09/2018.
//  Copyright © 2018 Giovanny Silva Esposito. All rights reserved.
//

import UIKit

class ViewCellDataSource: UIViewController, UITableViewDataSource {
    
    var jsonConfig = ServiceJSON()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return jsonConfig.jData.count
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubersCell") as? HubersCell else {return UITableViewCell()}
        cell.nameLabel.text? = self.jsonConfig.jData[indexPath.row].name
        cell.descriptionLabel.text? = self.jsonConfig.jData[indexPath.row].description
        cell.repoLabel.text? = self.jsonConfig.jData[indexPath.row].fullName
        cell.starsLabel.text? = ("\(self.jsonConfig.jData[indexPath.row].stargazersCount)")

        if
            let imageURL = URL(string: self.jsonConfig.jData[indexPath.row].owner.avatarURL) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                   let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgAvatar.image = image
                        cell.imgAvatar.layer.cornerRadius = cell.imgAvatar.frame.height / 2
                        cell.imgAvatar.clipsToBounds = true
                    }
                }
            }
        }
        return cell
    }
}
