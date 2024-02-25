import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let context: String
    
    // init() Creates an instance of the app using the body that you define for its content.
    init(id: String = UUID().uuidString, context: String) {
        self.id = id
        self.context = context
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, context: context)
    }
}
