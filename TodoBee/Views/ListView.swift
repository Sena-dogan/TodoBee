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
        List{
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.default) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List ✔︎")
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
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
