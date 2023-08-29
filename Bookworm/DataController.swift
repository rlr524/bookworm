//
//  DataController.swift
//  Bookworm
//
//  Created by Rob Ranf on 8/24/23.
//

import CoreData
import Foundation

// Remember that Swift classes are reference types and structs are value types, so we want to use
// a class here because we don't want to make copies of our DataController, we want to reference
// just the one data controller in memory throughout our application.
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
