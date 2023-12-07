//
//  Goal+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Lenabalakumar Subbarayan on 07/12/2023.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var desc: String?
    @NSManaged public var emoji: String?
    @NSManaged public var goalId: UUID?
    @NSManaged public var isAchieved: Bool
    @NSManaged public var progress: Int16
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension Goal {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension Goal : Identifiable {

}
