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
        
        VStack {
            
            Spacer()
            
            Text("할 일 추가하기")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.MyColorTheme.orangeColor)
                .padding(.bottom)

            
            NavigationLink {
                AddView()
            } label: {
                Text("작성하기")
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
            
            Spacer()
            
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyColorTheme.beigeColor.ignoresSafeArea())
    }
    
    
    
    //MARK: - FUNCTIONS
    func addAnimation() {
        guard !animate else { return }
        // UIKit및 SwiftUI의 모든 요소들은 'Main Queue'에서 수행되어야 한다.
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
        }
    }
}
