//
//  ViewModel.swift
//  CoreDataDemo
//
//  Created by Lenabalakumar Subbarayan on 07/12/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var goals: [Goal] = []
    @Published var numberOfGoals: Int = 0
    let context = PersistenceController.shared.container.viewContext
    
    init() {
        addGoal()
        directlyAddGoal()
        fetchAllGoals()
        numberOfGoals = PersistenceController.shared.fetchNumberOfGoals()
    }
    
    func addGoal() -> Void {
        PersistenceController.shared.addGoal(emoji: "📅", title: "Seventeen", desc: "Seventeen is a day of every month")
    }
    
    func directlyAddGoal() -> Void {
        let newGoal = Goal(context: context)
        newGoal.title = "Cow"
        newGoal.emoji = "🐮"
        newGoal.desc = "Cow is an animal"
        newGoal.timestamp = Date()
        newGoal.isAchieved = false
        newGoal.goalId = UUID()
        newGoal.progress = 0
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to create a goal from view model due to \(error.localizedDescription)")
        }
    }
    
    func fetchAllGoals() -> Void {
        goals = PersistenceController.shared.fetchAllgoals()
    }
    
    
}
