//
//  utility.swift
//  MyCreditManager
//
//  Created by jung on 2022/11/28.
//

import Foundation

let scoreToInt = [
    "A+": 4.5,
    "A": 4.0,
    "B+": 3.5,
    "B": 3.0,
    "C+": 2.5,
    "C": 2.0,
    "D+": 1.5,
    "D": 1.0,
    "F": 0
]

func lectureIndex(_ studentIdx: Int, _ lecture: String) -> Int? {
    return students[studentIdx].lectures.firstIndex(where: {$0.name == lecture})
}

func studentsIndex(_ name: String) -> Int? {
    return students.firstIndex(where: {$0.name == name})
}

