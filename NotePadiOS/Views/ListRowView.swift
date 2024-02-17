import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Text(item.context)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
            Spacer(minLength: 0)
            Text(item.context)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
        }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(context:"This is my first item.")
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
