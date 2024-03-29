import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
// View of NotePad List
    var body: some View {
            
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(
                            .easeIn))
                } else {
                    List {
                        Section {
                            ForEach(listViewModel.items) { item in
                                NavigationLink(
                                    destination: EditView(item: item,
                                                          textEditorTitle: item.title,
                                                          textEditorBody: item.body)) {
                                    ListRowView(item: item)
                                        .lineLimit(1)
                                        .onTapGesture {
                                            withAnimation(.linear) {
                                                listViewModel.updateItem(item: item)
                                            }
                                        }
                                }
                            }
                            .onDelete(perform: listViewModel.deleteItem)
                            .onMove(perform: listViewModel.moveItem)
                        }
                    }
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
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
