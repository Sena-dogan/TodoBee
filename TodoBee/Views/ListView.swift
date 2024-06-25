//
//  ListView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 25.06.2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "Bumblebee is AWESOME and a CAMARO!!!",
        "Optimus Prime is The Leader",
        "Mirage is Very Funnyy :))",
        "Nightbird is a R33 Skyline GT-R"
    ]
    
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
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
    }
}
