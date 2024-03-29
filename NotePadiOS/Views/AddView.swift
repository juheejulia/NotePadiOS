import SwiftUI

struct AddView: View {
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
        .navigationTitle("Add item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textEditorTitle, body: textEditorBody)
            // Page turns to ListView when saveButtonPressed
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textEditorBody.count < 1 || textEditorTitle.count < 1 {
            alertTitle = "Your new item must be at least 1 character long."
            showAlert.toggle()
            
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            }
        
            NavigationView {
                AddView()
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            }
        }
    }
}

