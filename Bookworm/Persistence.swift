//
//  Persistence.swift
//  Bookworm
//
//  Created by Rob Ranf on 9/7/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container = NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Bookworm")
        
        container.loadPersistentStores { (sto)
            
        }
    }
}
