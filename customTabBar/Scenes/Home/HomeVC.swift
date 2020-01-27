//
//  HomeVC.swift
//  customTabBar
//
//  Created by karim metawea on 1/25/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var homeTableView: UITableView!
    
    let categories = ["Hotspots","Events","Attractions"]
    var presenter:HomePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = HomePresenterImplementation(view: self)
        presenter?.viewDidLoad()
        searchTextField.withImage(direction: .left, image: #imageLiteral(resourceName: "location_search_icon"), colorSeparator: .clear, colorBorder: .clear)
        searchTextField.withImage(direction: .right, image: #imageLiteral(resourceName: "filter_inside_search"), colorSeparator: .gray, colorBorder: .clear)
        searchTextField.layer.cornerRadius = 15
        

    }
    


}

extension HomeVC:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return presenter?.numberOfCellsInHotspots ?? 0
        case 1:
            return presenter?.numberOfCellsInEvents ?? 0
        case 2:
            return presenter?.numberOfcellsInAttraction ?? 0
        default:
            return 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell") as! HomeTableViewCell
        presenter?.configureCell(cell: cell, for: indexPath.section)
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderCell
        cell.configureCell(category:categories[section])
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

extension HomeVC:HomeView{
    func finishedRetreiving() {
        self.homeTableView.reloadData()
    }
    
    func displayHomeRetrivalError(title: String, message: String) {
        print(title + message)
    }
    
    
}
