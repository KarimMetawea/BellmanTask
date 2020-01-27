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
        
//        HomeManager.fetchLatestData { (result) in
//            switch result{
//            case .success(let result):
//                print(result)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
