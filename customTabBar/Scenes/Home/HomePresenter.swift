//
//  HomePresenter.swift
//  customTabBar
//
//  Created by karim metawea on 1/26/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import Foundation

protocol HomeView:NSObject {
    func finishedRetreiving()
    func displayHomeRetrivalError(title:String,message:String)
}

protocol ItemsCellView {
    func configure(viewModel:TableCellViewModel)
}

protocol HomePresenter {
    var numberOfcellsInAttraction:Int{get}
    var numberOfCellsInEvents:Int{get}
    var numberOfCellsInHotspots:Int{get}
    func viewDidLoad()
    func configureCell(cell:ItemsCellView , for section:Int)
    
    
    
}

class HomePresenterImplementation: HomePresenter {
    private weak var view:HomeView?
    private var attractions:[Items] = []
    private var events:[Items] = []
    private var hotspots:[Items] = []
    
    var numberOfcellsInAttraction: Int{
        if attractions.count > 0{
            return 1
        }else{
            return 0
        }
    }
    
    var numberOfCellsInEvents: Int{
        if events.count > 0 {
            return 1
        }else{
            return 0
        }
    }
    
    var numberOfCellsInHotspots: Int{
        if hotspots.count > 0 {
            return 1
        }else{
            return 0
        }
    }
    
    init(view:HomeView) {
        self.view = view
    }
    
    func viewDidLoad() {
        self.fetchHomeData()
    }
    
    func configureCell(cell:ItemsCellView , for section:Int){
        let viewModel:TableCellViewModel
        switch section{
        case 0:
            viewModel = TableCellViewModel(items: hotspots)
        case 1:
            viewModel = TableCellViewModel(items: events)
        case 2:
            viewModel = TableCellViewModel(items: attractions)
        default:
            viewModel = TableCellViewModel(items: [])
        }
        cell.configure(viewModel: viewModel)
        
    }
    
    private func fetchHomeData(){
        HomeManager.fetchLatestData { (result) in
            switch result{
                
            case .success(let data):
                self.attractions = data.data.attractions
                self.events = data.data.events
                self.hotspots = data.data.hotSpots
                self.view?.finishedRetreiving()
            case .failure(let error):
                self.view?.displayHomeRetrivalError(title: "error", message: error.localizedDescription)
            }
        }
    }
    
    
}
