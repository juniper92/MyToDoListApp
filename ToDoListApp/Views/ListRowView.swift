//
//  ListRowView.swift
//  ToDoListApp
//
//  Created by HI on 2021/10/27.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
            
            Image("mission.card")
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Text(item.title)
                            .font(.headline)
                            .foregroundColor(Color.MyColorTheme.fontDarkgrayColor)
                        
                        Spacer()
                        
                        Image(systemName: item.isCompleted ? "checkmark.square.fill" : "square")
                            .foregroundColor(item.isCompleted ? Color.MyColorTheme.orangeColor : Color.MyColorTheme.fontNavyColor)
                            .font(.title2)
                    }
                    .padding()
                    .padding(.horizontal)
                )
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "첫번째", isCompleted: false)
    static var item2 = ItemModel(title: "두번째", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
