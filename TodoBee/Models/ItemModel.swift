//
//  ItemModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 2.07.2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateModel() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
