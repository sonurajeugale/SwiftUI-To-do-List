//
//  AddView.swift
//  TodoList
//
//  Created by Prathamesh Ugale on 14/02/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.isPresented) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textfieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textfieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(uiColor: .lightGray))
                .cornerRadius(5)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(5)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropraited() {
            listViewModel.addItem(title: textfieldText)
        }
        
        
        
    }
    
    func textIsAppropraited() -> Bool {
        if textfieldText.count < 3 {
            alertTitle = "Your to do list must contain more than 3 words"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
        .previewInterfaceOrientation(.portraitUpsideDown)
    }}

