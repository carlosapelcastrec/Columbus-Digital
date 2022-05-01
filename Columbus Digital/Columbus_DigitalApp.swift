//
//  Columbus_DigitalApp.swift
//  Columbus Digital
//
//  Created by carlos on 27/04/22.
//

import SwiftUI

@main
struct Columbus_DigitalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
