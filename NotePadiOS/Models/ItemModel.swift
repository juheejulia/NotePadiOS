import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let body: String
    
    // init() Creates an instance of the app using the body that you define for its content.
    init(id: String = UUID().uuidString, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
        
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, body: body)
    }
     
}
