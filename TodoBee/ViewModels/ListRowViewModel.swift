//
//  ListRowViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 16.07.2024.
//

import Foundation
import SwiftUI

class ListRowViewModel: ObservableObject {
    @Published var item: ItemModel
    
    init(item: ItemModel) {
        self.item = item
    }
    
    var imageName: String {
        return item.isCompleted ? "checkmark.circle" : "circle"
    }
    
    var imageColor: Color {
        return item.isCompleted ? .orange : .purple
    }
}
