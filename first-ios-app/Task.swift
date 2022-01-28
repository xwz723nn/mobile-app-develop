//
//  Task.swift
//  first-ios-app
//
//  Created by 张曦文 on 1/22/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
}
