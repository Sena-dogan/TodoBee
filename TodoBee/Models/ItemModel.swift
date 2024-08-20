//
//  ItemModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 2.07.2024.
//

import Foundation
import SwiftUI

// MARK: - Item Model
struct ItemModel: Identifiable, Codable {
    let id: String
    var title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateModel() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
