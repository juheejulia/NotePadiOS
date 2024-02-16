import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Text(item.title)
                .font(.title2)
                .padding(.vertical, 8)
            Spacer()
            Text(item.content)
                .font(.title2)
                .padding(.vertical, 8)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title:"Firstitem", content: "This is my first item!")
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
