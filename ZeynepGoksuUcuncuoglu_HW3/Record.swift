//
//  Record.swift
//  CTIS480_Fall2223_HW3
//
//  Created by CTIS Student on 2.12.2022.
//  Copyright © 2022 CTIS. All rights reserved.
//


import Foundation

class Record {
    var name: String
    var category: String
    var description: String
    var image: String
    
    init(name: String, category: String, description: String, image: String) {
        self.category = category
        self.name = name
        self.description = description
        self.image = image
    }
        
}
