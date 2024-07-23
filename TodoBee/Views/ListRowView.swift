//
//  ListRowView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 25.06.2024.
//

import SwiftUI

struct ListRowView: View {
    
    @ObservedObject var viewModel: ListRowViewModel
    
    var body: some View {
        HStack {
            Image(systemName: viewModel.imageName)
                .font(.system(size: 30))
                .foregroundColor(viewModel.imageColor)
            Text(viewModel.item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "item 1", isCompleted: true)
    static var item2 = ItemModel(title: "item 2", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(viewModel: ListRowViewModel(item: item1))
            ListRowView(viewModel: ListRowViewModel(item: item2))
        }
    }
}
