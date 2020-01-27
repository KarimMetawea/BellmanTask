//
//  HomeCollectionCell.swift
//  customTabBar
//
//  Created by karim metawea on 1/26/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    func configureCell(model:Items){
        self.cellImage.kf.indicatorType = .activity
//        if let urlstring = model.profilePhoto {
//            self.cellImage.kf.setImage(with: URL(string: urlstring)!, placeholder: UIImage(named: "PlaceHolder"), options:  [.transition(.fade(0.1))])
//        }else{
            if model.photos.count > 0 {
                self.cellImage.kf.setImage(with: URL(string: model.photos[0])!, placeholder: UIImage(named: "PlaceHolder"), options:  [.transition(.fade(0.1))])
            }else{
                self.cellImage.image = UIImage(named: "PlaceHolder")
            }
//        }
        
        self.itemName.text = model.name
        
    }
    
}
