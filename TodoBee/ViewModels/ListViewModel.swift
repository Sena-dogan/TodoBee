//
//  ListViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 8.07.2024.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "Bumblebee is AWESOME and a CAMARO!!!", isCompleted: false),
            ItemModel(title: "Optimus Prime is The Leader", isCompleted: false),
            ItemModel(title: "Mirage is Very Funnyy :))", isCompleted: true),
            ItemModel(title: "Nightbird is a R33 Skyline GT-R", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateModel()
        }
    }
    
    func textIsAppropriate(text: String) -> Bool {
        if text.count <= 0 {
            alertTitle = "Your item can not be empty 😱😱😱"
            showAlert.toggle()
            return false
        }
        return true
    }

    func saveButtonPressed(text: String, presentationMode: Binding<PresentationMode>) {
        if textIsAppropriate(text: text) {
            addItem(title: text)
            presentationMode.wrappedValue.dismiss()
        }
    }
}
