import SwiftUI
import CoreData

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>
    
// View of NotePad List
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(
                        .easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                //.listStyle(PlainListStyle())
            }
        }
        .navigationTitle("My Note")
        .navigationBarItems(
             leading: EditButton(),
             trailing:
                 NavigationLink("Add", destination: AddView())
            )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        .environmentObject(ListViewModel())
    }
}
