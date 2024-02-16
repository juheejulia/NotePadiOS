import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let content: String
    //let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, content: content)
    }
}
