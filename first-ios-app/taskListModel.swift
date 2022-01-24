//
//  taskListModel.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/22/22.
//

import Foundation
import Combine

class TaskListModel: ObservableObject{
    @Published var taskViewModel = [TaskViewModel]()
    private var cancelMarks = Set<AnyCancellable>()
    @Published var taskRepo = TaskRepo()
    
    init() {
        taskRepo.$tasks.map { tasks in
            tasks.map { task in
                TaskViewModel(task:task)
            }
        }.assign(to: \.taskViewModel, on: self)
            .store(in : &cancelMarks)
        print(taskViewModel)
    }
    func addTask(task: Task) {
        let taskVM = TaskViewModel(task: task)
        self.taskViewModel.append(taskVM)
        print(task)
        print(taskVM)
        taskRepo.addTask(task)
    }
    func deleteTask(task: Task) {
        taskRepo.deleteTask(task)
    }
}
