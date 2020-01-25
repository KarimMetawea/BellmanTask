//
//  HeaderCell.swift
//  customTabBar
//
//  Created by karim metawea on 1/25/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(category:String){
        self.categoryImage.image = UIImage(named: category)
        self.categoryName.text = category
    }
    
    @IBAction func viewAllPressed(_ sender: Any) {
    }
    
}
