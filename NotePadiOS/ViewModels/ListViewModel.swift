import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItem()
    }
    
    func getItem() {
        let newItems = [
            ItemModel(title: "The First", content: "This is my first note.")
        ]
        items.append(contentsOf: newItems)
    }
    
    func addItem(title: String, content: String) {
        let newItem = ItemModel(title: title, content: content)
        items.append(newItem)
    }
        
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()    
}
