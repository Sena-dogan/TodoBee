//
//  constants.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 16.07.2024.
//

import Foundation
import SwiftUI

struct Constants {
    struct Texts {
        static let saveButton = "Save"
        static let textFieldPlaceholder = "Type something here..."
        static let addItemTitle = "Add an Item ✍︎"
        static let alertTitle = "Your item can not be empty 😱😱😱"
        static let listViewTitle = "Todo List ✔︎"
        static let alertDismissTitle = "OK"
    }
    
    struct Colors {
        static let buttonBackground = Color.orange
        static let textFieldBackground = Color(.systemGray5)
    }
    
    struct Dimensions {
        static let textFieldHeight: CGFloat = 55
        static let buttonHeight: CGFloat = 55
        static let padding: CGFloat = 14
    }
}
