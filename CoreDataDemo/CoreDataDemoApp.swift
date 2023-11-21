//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by Lenabalakumar Subbarayan on 21/11/2023.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
