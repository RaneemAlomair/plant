//
//  SwiftUIView4.swift
//  plant
//
//  Created by Raneem Alomair on 25/04/1446 AH.
//

import SwiftUI
import Combine

class PlantViewModel: ObservableObject {
    @Published var Plants: [Plant] = []
    
    // Function to add a new reminder
    func addReminder(_ plant: Plant) {
        Plants.append(plant)
    }
    
    // Function to update an existing reminder
    func updateReminder(_ plant: Plant) {
        if let index = Plants.firstIndex(where: { $0.id == plant.id }) {
            Plants[index] = plant
        }
    }
    
    // Function to delete a reminder based on IndexSet
    func deleteReminder(at offsets: IndexSet) {
        Plants.remove(atOffsets: offsets)
    }
    
    // Function to toggle the checked status of a reminder
    func toggleCheck(for plant: Plant) {
        if let index = Plants.firstIndex(where: { $0.id == plant.id }) {
            Plants[index].isWatered.toggle()
        }
    }
    
    // Property to check if all reminders are completed
    var areAllRemindersCompleted: Bool {
        return Plants.allSatisfy { $0.isWatered }
    }
}


//import SwiftUI
//
//class PlantViewModel: ObservableObject {
//    @Published var plants: [Plant] = [
//        Plant(name: "Monstera", location: "Kitchen", sunlight: "Full Sun", waterAmount: "20-50 ml", isWatered: false),
//        Plant(name: "Pothos", location: "Bedroom", sunlight: "Full Sun", waterAmount: "20-50 ml", isWatered: true)
//    ]
//
//    func addPlant(name: String, location: String, sunlight: String, waterAmount: String) {
//        let newPlant = Plant(name: name, location: location, sunlight: sunlight, waterAmount: waterAmount, isWatered: false)
//        plants.append(newPlant)
//    }
//
//    func addPlant(_ plant: Plant) {
//            plants.append(plant)
//        }
//
//
//
//}
