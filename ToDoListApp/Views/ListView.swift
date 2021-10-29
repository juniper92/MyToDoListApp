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
                VStack {
                    HStack {
                        Button {
                            self.isEditing.toggle()
                            self.addButtonDisabled.toggle()
                        } label: {
                            if self.isEditing {
                                Text("완료")
                                    .font(.title3)
                            } else {
                                Image(systemName: "pencil")
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            self.addItemViewIsVisible.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .disabled(addButtonDisabled)
                    }
                    .foregroundColor(Color.MyColorTheme.orangeColor)
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.bottom, 4)

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
                }}
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(listViewModel.items.isEmpty ? "" : "내 미션")
        .navigationBarTitleDisplayMode(.inline)
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
