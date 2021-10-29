//
//  NoItemsView.swift
//  ToDoListApp
//
//  Created by HI on 2021/10/28.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("나만의 미션을 추가해보세요!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.MyColorTheme.orangeColor)
                    .padding(.bottom)
                
                Text("하단의 버튼을 눌러 나만의 미션을 만들어봐요")
                    .foregroundColor(Color.MyColorTheme.fontNavyColor)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("미션 추가")
                        .foregroundColor(Color.MyColorTheme.beigeColor)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.MyColorTheme.orangeColor : Color.MyColorTheme.fontNavyColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.MyColorTheme.orangeColor.opacity(0.2) : Color.MyColorTheme.fontNavyColor.opacity(0.2),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 10 : 20)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyColorTheme.beigeColor)
//        .navigationTitle("미션")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}


struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
//                .navigationTitle("Title")
        }
    }
}
