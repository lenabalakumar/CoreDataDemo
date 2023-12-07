//
//  Persistence.swift
//  CoreDataDemo
//
//  Created by Lenabalakumar Subbarayan on 21/11/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for _ in 0..<5 {
            let newItem = Item(context: viewContext)
            let newPerson = Person(context: viewContext)
            newItem.timestamp = Date()
            newPerson.name = "Habrabar"
        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }()

    let container: NSPersistentContainer
    
    func fetchAllgoals() -> [Goal] {
        let req = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            return try container.viewContext.fetch(req)
        } catch {
            return []
        }
    }
    
    func fetchNumberOfGoals() -> Int {
        var count = 0
        let req = NSFetchRequest<Goal>(entityName: "Goal")
        
        req.resultType = .countResultType
        
        do {
            let countResult = try container.viewContext.fetch(req)
            count = countResult.count
        } catch {
            print("Error while fetching number of goals due to \(error)")
        }
        return count
    }
    
    func addGoal(emoji: String, title: String, desc: String) -> Void {
        let newGoal = Goal(context: container.viewContext)
        
        newGoal.goalId = UUID()
        newGoal.emoji = emoji
        newGoal.title = title
        newGoal.desc = desc
        newGoal.progress = 0
        newGoal.isAchieved = false
        newGoal.timestamp = Date()
        
        do {
            try container.viewContext.save()
        } catch {
            print("Unable to create a goal due to \(error.localizedDescription)")
        }
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreDataDemo")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
