//
//  ListViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 8.07.2024.
//

import Foundation
import SwiftUI

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    var alertTitle: String = ""
    @Published var showAlert: Bool = false
    let itemsKey: String = "items_list "
    
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
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
    
    func updateItem(at index: Int) {
        items[index] = items[index].updateModel()
    }
    
    func textIsAppropriate(text: String) -> Bool {
        if text.count <= 0 {
            alertTitle = Constants.Texts.alertTitle
            showAlert.toggle()
            return false
        }
        return true
    }

    func saveButtonPressed(text: String, presentationMode: Binding<PresentationMode>) {
            guard textIsAppropriate(text: text) else {
                return
            }
            addItem(title: text)
            presentationMode.wrappedValue.dismiss()
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
}
