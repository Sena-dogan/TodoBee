//
//  UserDefaultsHelper.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 17.07.2024.
//

import Foundation

class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    private let itemsKey = "items_list"

    private init() {}

    func saveItems(_ items: [ItemModel]) {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }

    func getItems() -> [ItemModel]? {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return nil
        }
        return savedItems
    }
}

