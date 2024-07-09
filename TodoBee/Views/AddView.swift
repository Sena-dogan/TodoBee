//
//  AddView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 25.06.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                
                Button(action: {
                    listViewModel.saveButtonPressed(text: textFieldText, presentationMode: presentationMode)
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                })
                .padding(.vertical)
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✍︎")
        .alert(isPresented: $listViewModel.showAlert) {
            Alert(title: Text(listViewModel.alertTitle))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
