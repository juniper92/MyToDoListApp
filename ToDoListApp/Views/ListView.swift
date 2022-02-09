//
//  ListView.swift
//  ToDoListApp
//
//  Created by HI on 2021/10/26.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var isEditing = false
    @State var addButtonDisabled = false
    @State var addItemViewIsVisible = false
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                ZStack(alignment: .bottomTrailing) {
                    VStack {
                        List {
                            ForEach(listViewModel.items) { item in
                                ListRowView(item: item)
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            listViewModel.updateItem(item: item)
                                        }
                                    }
                            }
                            .onDelete(perform: listViewModel.deleteItem)
                            .onMove(perform: listViewModel.moveItem)
                        }
                        .listStyle(PlainListStyle())
                    }
                    
                    Button {
                        self.addItemViewIsVisible.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding()
                            
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(listViewModel.items.isEmpty ? "" : "오늘 목표")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading:
                Button(action: {
                self.isEditing.toggle()
                self.addButtonDisabled.toggle()
            }, label: {
                if self.isEditing {
                    Text("완료")
                } else {
                    listViewModel.items.isEmpty ?  Text("") : Text("편집")
                }
            }),

            trailing: Button(action: {
                listViewModel.deleteAllItem()
            }, label: {
                listViewModel.items.isEmpty ? Text("") : Text("전체삭제")
            })
                .disabled(addButtonDisabled)
        )
        .accentColor(Color.MyColorTheme.orangeColor)
        .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
        .sheet(isPresented: $addItemViewIsVisible) {
            AddView()
        }
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
