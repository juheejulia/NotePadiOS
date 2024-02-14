//
//  NotePadiOSApp.swift
//  NotePadiOS
//
//  Created by Juhee Kang Johansson on 2024-02-14.
//

import SwiftUI

@main
struct NotePadiOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
