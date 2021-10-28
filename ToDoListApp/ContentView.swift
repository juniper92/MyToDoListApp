//
//  ContentView.swift
//  ToDoListApp
//
//  Created by HI on 2021/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
            }
            
            NavigationView {
                DiaryView()
            }
            .tabItem {
                Image(systemName: "square.and.pencil")
            }
        }
        .accentColor(Color.MyColorTheme.orangeColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
