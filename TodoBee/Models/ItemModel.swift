//
//  ItemModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 2.07.2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
