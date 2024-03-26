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
            VStack (spacing: 10) {
                ZStack {
                    TextEditor(text: $textEditorTitle)
                    // Hide the white defualt white background
                        .scrollContentBackground(.hidden)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .font(.title)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                    if textEditorTitle.isEmpty {
                        Text("Write your title here.") //placeHolderText
                            .position(x: 95, y: 20)
                            .foregroundStyle(.tertiary)
                    }
                }
                ZStack {
                    TextEditor(text: $textEditorBody)
                    // Hide the white defualt white background
                        .scrollContentBackground(.hidden)
                        .padding(.horizontal)
                        .frame(height: 450)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                    if textEditorBody.isEmpty {
                        Text("Write your text here.") //placeHolderText
                            .position(x: 95, y: 20)
                            .foregroundStyle(.tertiary)
                    }
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
        .navigationTitle("Edit item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    // Save updatedItem
    func saveButtonPressed() {
        if textIsAppropriate() {
            var updatedItem = item.updateCompletion()
            updatedItem.title = textEditorTitle
            updatedItem.body = textEditorBody
            listViewModel.updateItem(item: updatedItem)
            
            // Page turns to ListView when saveButtonPressed
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if textEditorTitle.count < 1 || textEditorBody.count < 1 {
            alertTitle = "Your new item must be at least 1 character long"
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

