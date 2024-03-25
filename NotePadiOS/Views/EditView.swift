import SwiftUI

struct EditView: View {
    
    let item: ItemModel
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textEditorTitle: String = ""
    @State var textEditorBody: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 30) {
                ZStack {
                    TextEditor(text: $textEditorBody)
                    // Hide the white defualt white background
                        .scrollContentBackground(.hidden)
                        .padding(.horizontal)
                        .frame(height: 500)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                }
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Update Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    // Save updatedItem
    func saveButtonPressed() {
        if textIsAppropriate() {
            var updatedItem = item.updateCompletion()
            updatedItem.body = textEditorBody
            updatedItem.title = textEditorTitle
            listViewModel.updateItem(item: updatedItem)
            
            // Page turns to ListView when saveButtonPressed
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if textEditorBody.count < 1 {
            alertTitle = "Your new item must be at least 1 character long.  \n😱🤯🥶"
            showAlert.toggle()
            
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        let newItem = ItemModel(title: "testTitle", body: "testBody")
        
        Group {
            NavigationView {
                EditView(item: newItem)
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            }
        
            NavigationView {
                EditView(item: newItem)
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            }
        }
    }
}

