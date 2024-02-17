import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertText: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    // It works good in dark mode
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
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
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }

    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(context: textFieldText)
            //Page turns to ListView when saveButtonPresseed
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertText = "Text should be at least 1 character long."
            showAlert.toggle()

            return false
        }
        return true
    }
        func getAlert() -> Alert {
            return Alert(title: Text(alertText))
        }
    }

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView {
                AddView()
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            }
        }
    }
}
