//
//  HomeTableViewCell.swift
//  customTabBar
//
//  Created by karim metawea on 1/25/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel:TableCellViewModelProtocol?{
        didSet{
            collectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfIems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! HomeCollectionCell
        if let model = viewModel?.itemForCell(at: indexPath.row){
            cell.configureCell(model:model )
        }
        
        return cell
    }
    
    
}

extension HomeTableViewCell:ItemsCellView{
    func configure(viewModel: TableCellViewModel) {
        self.viewModel = viewModel

    }
    
    
}
