//
//  ContentView.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/21/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskListModel = TaskListModel()
    @State var addNew = false
    let tasks = testDataTasks
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(taskListModel.taskViewModel) {
                        taskModel in
                        taskView(taskModel: taskModel)
                    }//iterate every list
                if addNew {
                    taskView(taskModel: TaskViewModel(task: Task(title:"", completed: false)))
                             {task in
                        self.taskListModel.addTask(task: task)
                        self.addNew.toggle()
                    }
                    }
                }
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Button("Add New Task") {
                        self.addNew.toggle()
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }.padding()
            }.navigationTitle("Tasks")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView()

        }
    }
}

struct taskView: View {
    @ObservedObject var taskModel: TaskViewModel
    var onCommit: (Task) -> (Void) = {_ in} //don't need to have a name
    var body: some View {
        HStack {
            Image(systemName: taskModel.task.completed ? "checkmark.circle.fill": "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture{
                    taskModel.task.completed.toggle()
                }
            TextField("Enter your todo", text: $taskModel.task.title, onCommit: {
                self.onCommit(self.taskModel.task)
            })
        }
    }
}
