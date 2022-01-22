//
//  taskViewModel.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/22/22.
//

import Foundation
import Combine
import simd
class TaskViewModel: Identifiable, ObservableObject {
    @Published var task : Task
    var id = ""
    @Published var completedCircle = ""
    private var cancelMark = Set<AnyCancellable>()
    init (task : Task) {
        self.task = task
        $task
            .map{task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completedCircle, on: self)
            .store(in : &cancelMark)
        $task
            .map { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancelMark)
    }
    
}
