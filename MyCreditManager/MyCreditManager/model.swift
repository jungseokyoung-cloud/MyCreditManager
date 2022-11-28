//
//  model.swift
//  MyCreditManager
//
//  Created by jung on 2022/11/28.
//

import Foundation

struct Lecture {
    let name: String
    var score: String
}


struct Student {
    let name: String
    var lectures: [Lecture] = []
    
    init(_ name: String) {
        self.name = name
    }
}
