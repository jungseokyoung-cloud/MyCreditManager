//
//  controller.swift
//  MyCreditManager
//
//  Created by jung on 2022/11/28.
//

import Foundation

func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    let optionalInput = readLine()
    
    guard let input = optionalInput else {
        print("입력이 잘못되었습니다. 다시 확인해 주세요.")
        return
    }
    
    if studentsIndex(input) == nil{
        students.append(Student(input))
        print("\(input) 학생을 추가하였습니다.")
    }
    else {
        print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    }
}

func deleteStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    let optionalInput = readLine()
    
    guard let input = optionalInput else {
        print("입력이 잘못되었습니다. 다시 확인해 주세요.")
        return
    }
    
    if let index = studentsIndex(input) {
        students.remove(at: index)
        print("\(input) 학생을 삭제하였습니다.")
    }
    else {
        print("\(input) 학생을 찾지 못했습니다.")
    }
    
}

func addScore() {
    print("성적을 추가할 삭생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input.count != 3 || scoreToInt[input[2]] == nil{
        print("입력이 잘못되었습니다. 다시 확인해 주세요.")
        return
    }
    if let studentIdx = studentsIndex(input[0]) {
        
        if let lectureIdx = lectureIndex(studentIdx, input[1]) {
            students[studentIdx].lectures[lectureIdx].score = input[2]
            print("\(input[0])의 성적 \(input[1])의 성적을 \(input[2])로 갱신하였습니다.")
        }
        else {
            students[studentIdx].lectures.append(Lecture(name: input[1], score: input[2]))
            print("\(input[0])의 성적 \(input[1])의 성적을 추가하였습니다.")
        }
    }
    
    else {
        print("\(input[0]) 학생을 찾지 못했습니다.")
    }
    
}

func deleteScore() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input.count != 2 {
        print("입력이 잘못되었습니다. 다시 확인해 주세요.")
        return
    }
    
    if let studentIdx = studentsIndex(input[0]) {
        if let lectureIdx = lectureIndex(studentIdx, input[1]) {
            students[studentIdx].lectures.remove(at: lectureIdx)
            print("\(input[0]) 학생의 \(input[1]) 과목의 성적이 삭제되었습니다.")
            
        }
        else {
            print("존재하지 않는 과목이름입니다.")
        }
    }
    else {
        print("\(input[0]) 을 찾지 못했습니다.")
    }
}



func printScore() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    let optionalInput = readLine()
    
    guard let input = optionalInput else {
        print("입력이 잘못되었습니다. 다시 확인해 주세요.")
        return
    }
    
    if let studentIdx = studentsIndex(input) {
        var sum = 0.0
        for lecture in students[studentIdx].lectures {
            print("\(lecture.name) : \(lecture.score)")
            sum += scoreToInt[lecture.score]!
        }
        let avg = sum / Double(students[studentIdx].lectures.count)
        print("평점 : \(String(format: "%.2f", avg))")
        
    }
    else {
        print("\(input)학생을 찾기 못했습니다.")
    }
}
