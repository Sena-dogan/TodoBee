//
//  AddViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 9.07.2024.
//

import Foundation

class AddViewModel: ObservableObject {
    
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
}
