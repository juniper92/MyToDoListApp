//
//  AddView.swift
//  ToDoListApp
//
//  Created by HI on 2021/10/27.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                    Image("mission.card")
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            TextField("", text: $textFieldText)
                                .frame(height: 55)
                                .foregroundColor(Color.MyColorTheme.fontNavyColor)
                                .padding(.horizontal, 30)
                                .cornerRadius(10)
                                .multilineTextAlignment(.leading)
                                .placeholder(when: textFieldText.isEmpty) {
                                    Text("이곳에 입력하세요...").foregroundColor(Color.MyColorTheme.fontLightgrayColor)
                                        .padding()
                                        .padding(.horizontal)
                                }
                        )
                
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("저장하기")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.MyColorTheme.orangeColor)
                        .cornerRadius(10)
                }
                
            }
            .padding(20)
        }
        //        .navigationTitle("내 미션 추가")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() == true {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "3글자 이상 입력해주세요!"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}
