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
                TextField(Constants.Texts.textFieldPlaceholder, text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: Constants.Dimensions.textFieldHeight)
                    .background(Constants.Colors.textFieldBackground)
                    .cornerRadius(10)
                
                Button(action: {
                    listViewModel.saveButtonPressed(text: textFieldText, presentationMode: presentationMode)
                }, label: {
                    Text(Constants.Texts.saveButton.uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: Constants.Dimensions.buttonHeight)
                        .frame(maxWidth: .infinity)
                        .background(Constants.Colors.buttonBackground)
                        .cornerRadius(10)
                })
                .padding(.vertical)
            }
            .padding(Constants.Dimensions.padding)
        }
        .navigationTitle(Constants.Texts.addItemTitle)
        .alert(isPresented: $listViewModel.showAlert) {
            Alert(
                title: Text(listViewModel.alertTitle),
                dismissButton: .default(Text(Constants.Texts.alertDismissTitle)) {
                    listViewModel.showAlert = false
                }
            )
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
