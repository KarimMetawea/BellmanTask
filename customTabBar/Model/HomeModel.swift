//
//  HomeModel.swift
//  customTabBar
//
//  Created by karim metawea on 1/26/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import Foundation
struct HomeModel:Codable {
    var status:Int
    var message:String
    var data:Data
    enum CodingKeys: String, CodingKey {
           case message,data
           case status = "status_code"
           
          }
    
}

struct Data:Codable {

    var attractions:[Items]
    var events:[Items]
    var hotSpots:[Items]
    
    enum CodingKeys: String, CodingKey {
        case attractions
        case events
        case hotSpots = "hot_spots"
        
       }
    
}

struct Items:Codable{
   var  id:Int
   var name:String
   var photos:[String]
   var profilePhoto:String?
    
    enum CodingKeys: String, CodingKey {
     case id,name,photos
     case profilePhoto = "profile_photo"
     
    }
}
