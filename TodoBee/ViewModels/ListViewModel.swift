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
            UserDefaultsHelper.shared.saveItems(items)
        }
    }
    var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    init() {
        getItems()
    }
    
    func getItems() {
        if let savedItems = UserDefaultsHelper.shared.getItems() {
            self.items = savedItems
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }

    func updateItem(at index: Int) {
        items[index].isCompleted.toggle()
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
}
