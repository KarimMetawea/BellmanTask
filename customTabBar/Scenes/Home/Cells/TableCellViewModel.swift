//
//  CellViewModel.swift
//  customTabBar
//
//  Created by karim metawea on 1/27/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import Foundation

protocol TableCellViewModelProtocol {
    var numberOfIems:Int{get}
    func itemForCell(at index:Int )-> Items
}



class TableCellViewModel:TableCellViewModelProtocol {
    var numberOfIems: Int{
        return items.count
    }
    
    func itemForCell(at index: Int) -> Items {
        return items[index]
    }
    
    private var items:[Items]
    
    init(items:[Items]) {
        self.items = items
    }
    
}
