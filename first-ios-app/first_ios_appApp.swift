//
//  first_ios_appApp.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/21/22.
//

import SwiftUI
import Firebase

@main
struct first_ios_appApp: App {
    init() {
        FirebaseApp.configure()
        let ref = Database.database().reference()
        ref.child("Name/student").setValue("Mike")
    }
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}

