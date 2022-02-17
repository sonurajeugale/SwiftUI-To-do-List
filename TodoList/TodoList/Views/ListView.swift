//
//  ListView.swift
//  TodoList
//
//  Created by Prathamesh Ugale on 14/02/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                Text("No Items")
            }
        }
        .navigationTitle("To Do List")
        .navigationBarItems(leading: EditButton(), trailing:
            NavigationLink("Add", destination: AddView())
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


