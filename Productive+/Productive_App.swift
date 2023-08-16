//
//  Productive_App.swift
//  Productive+
//
//  Created by scholar on 8/15/23.
//

import SwiftUI

@main
struct Productive_App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
