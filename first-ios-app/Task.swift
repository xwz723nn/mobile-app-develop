//
//  Task.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/22/22.
//

import Foundation
struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

let testDataTasks = [
    Task(title: "UI", completed: true),
    Task(title: "connect", completed: false),
    Task(title: "grocery", completed: false),
    Task(title: "whatever", completed: false)
]
