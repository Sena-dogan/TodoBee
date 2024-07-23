//
//  ListView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 25.06.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(Array(listViewModel.items.enumerated()), id: \.element.id) { index, item in
                ListRowView(viewModel: ListRowViewModel(item: item))
                    .onTapGesture {
                        withAnimation(.default) {
                            listViewModel.updateItem(at: index)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Constants.Texts.listViewTitle)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(destination: AddView()) {
                Image(systemName: "plus")
                    .imageScale(.large)
            }
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
