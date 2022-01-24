//
//  TaskRepo.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/23/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepo: ObservableObject {
    let db = Firestore.firestore()
    @Published var tasks = [Task]() //list of Task struct
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("tasks").addSnapshotListener {(querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap {
                    document in
                    try? document.data(as: Task.self)
                }
            }
            
        }
    }
    func addTask(_ task: Task) {
        do {
           let _ = try db.collection("tasks").addDocument(from : task)
        }
        catch {
            fatalError("Error occurs")
        }
    }
    func deleteTask(_ task : Task) {
        do {
            let _ = try db.collection("tasks").document(task.id!).delete()
        }
        catch{
            fatalError("cannot Delete")
        }
    }
}
