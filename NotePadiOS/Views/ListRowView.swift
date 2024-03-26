import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.title2)
            Text(item.body)
                .font(.body)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Title", body:"First item!")
    static var item2 = ItemModel(title: "Second Title", body:"Second item!")
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
