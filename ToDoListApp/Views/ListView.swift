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
                    
                    VStack {
                        Button {
                            self.isEditing.toggle()
                            self.addButtonDisabled.toggle()
                        } label: {
                            if self.isEditing {
                                Image(systemName: "checkmark.square.fill")
                            } else {
                                Image(systemName: "pencil.circle.fill")
                            }
                        }

                        Button {
                            self.addItemViewIsVisible.toggle()
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                        .disabled(addButtonDisabled)
                    }
                    .foregroundColor(Color.MyColorTheme.orangeColor)
                    .font(.title)
                    .padding(.bottom)
                    .padding(.trailing)

                }}
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(listViewModel.items.isEmpty ? "" : "오늘 할 일")
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
