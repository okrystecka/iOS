//
//  funkyModel.swift
//  Exercises
//
//  Created by user1 on 16.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import Foundation
import ObjectMapper

struct FunkyModel: Mappable {
    
    var title: String = ""
    var description: String = ""
    var soManyLikes: Int = 0
    var soManyOptions: [Int] = []
    var coordinate: [Double] = []
    
    init(title: String, description: String, soManyLikes: Int, soManyOptions: [Int], coordinate: [Double] ) {
        self.title = title
        self.description = description
        self.soManyLikes = soManyLikes
        self.soManyOptions = soManyOptions
        self.coordinate = coordinate
        
    }
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        soManyLikes <- map["soManyLikes"]
        soManyOptions <- map["soManyOptions"]
        coordinate <- map["coordinate"]
    }
}
