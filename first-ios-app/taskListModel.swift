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
    
    init() {
        self.taskViewModel = testDataTasks.map { task in
            TaskViewModel(task: task)
        }
    }
    func addTask(task: Task) {
        let taskVM = TaskViewModel(task: task)
        self.taskViewModel.append(taskVM)
    }
}
