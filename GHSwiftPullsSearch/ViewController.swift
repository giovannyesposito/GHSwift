//
//  ViewController.swift
//  GHSwiftPullsSearch
//
//  Created by Giovanny Silva Esposito on 14/09/2018.
//  Copyright © 2018 Giovanny Silva Esposito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    fileprivate var arrayDeItems = [Item]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDownload()
    }
    
    func jsonDownload() {
        guard let jsonURL = ConfigUrlJSON().jsonURL else {return}
        URLSession.shared.dataTask(with: jsonURL) { (data, jsonResponse, error) in
            guard let data = data, error == nil, jsonResponse != nil else {
                print(GlobalConstantes.somethingWrong)
                return
            }
            print(GlobalConstantes.downloadDone)
            do{
                let decoder = JSONDecoder()
                let jsonResp = try decoder.decode(ItemsJson.self, from: data)
                let jObejct = jsonResp.items
                self.arrayDeItems = jObejct
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
              print(GlobalConstantes.somethingWrong)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubersCell") as? HubersCell else {return UITableViewCell()}
        cell.nameLabel.text? = self.arrayDeItems[indexPath.row].name
        cell.descriptionLabel.text? = self.arrayDeItems[indexPath.row].description
        cell.repoLabel.text? = self.arrayDeItems[indexPath.row].fullName
        cell.starsLabel.text? = ("\(self.arrayDeItems[indexPath.row].stargazersCount)")
        
        if
            let imageURL = URL(string: self.arrayDeItems[indexPath.row].owner.avatarURL) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                   let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgAvatar.image = image
                        cell.imgAvatar.layer.cornerRadius = cell.imgAvatar.frame.height / 1
                        cell.imgAvatar.clipsToBounds = true
                    }
                }
            }
        }
        return cell
    }
    
}


