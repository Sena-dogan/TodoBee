//
//  ContentView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 25.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(listViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
