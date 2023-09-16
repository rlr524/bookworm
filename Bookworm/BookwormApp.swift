//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Rob Ranf on 8/23/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    // @StateObject private var dataController = DataController.shared
    let dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
