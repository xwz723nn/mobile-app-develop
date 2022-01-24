//
//  ContentView.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/21/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    @ObservedObject var taskListModel = TaskListModel()
    @State var addNew = false
    let tasks = testDataTasks
    var body: some View {
        HStack {
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
                            
                        }
                    }.padding()
                }.navigationTitle("Todos")
            }
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
    let db = Firestore.firestore()
    @ObservedObject var taskModel: TaskViewModel
    var onCommit: (Task) -> (Void) = {_ in} //don't need to have a name
    func deleteTask(task: Task) {
        db.collection("tasks").document(task.id!).delete()
        self.taskModel.taskRepo.loadData()
    }
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
            Button() {
                deleteTask(task: self.taskModel.task)
            } label: {
                Label("", systemImage:"trash")
            }
        }
        
    }
        
}
