//
//  ContentView.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/21/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskListModel = TaskListModel()
    let tasks = testDataTasks
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(taskListModel.taskViewModel) {taskModel in
                    taskView(taskModel: taskModel)
                }
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Button("Add New Task") {
                        
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
    var body: some View {
        HStack {
            Image(systemName: taskModel.task.completed ? "checkmark.circle.fill": "circle")
                .resizable()
                .frame(width: 20, height: 20)
            Text(taskModel.task.title)
        }
    }
}
