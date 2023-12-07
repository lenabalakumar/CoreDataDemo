//
//  Task+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Lenabalakumar Subbarayan on 07/12/2023.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var isAchieved: Bool
    @NSManaged public var reminderTime: Date?
    @NSManaged public var taskId: UUID?
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var goal: Goal?

}

extension Task : Identifiable {

}
