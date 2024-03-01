//
//  LTimeApp.swift
//  LTime
//
//  Created by komamura ryuichi on 2024/02/25.
//

import SwiftUI

@main
struct LTimeApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environmentObject(TaskData())
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
