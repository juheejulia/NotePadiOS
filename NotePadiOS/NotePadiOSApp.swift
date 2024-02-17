/* Individual Task
   Created by Juhee Kang Johansson on 2024-02-14.
   Architecture: MVVM
   Model - data point
   View - UI
   ViewModel - manages Models for View
 */


import SwiftUI

@main
struct NotePadiOSApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            // It makes all different size of device include ipad navigationview as standard
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
