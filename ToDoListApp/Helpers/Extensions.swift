//
//  Extensions.swift
//  ToDoListApp
//
//  Created by HI on 2021/10/27.
//

import SwiftUI
import Foundation

extension Color {
    
    struct MyColorTheme {
        
        // MARK: - 포인트색상
        static var orangeColor: Color {
            return Color("ColorOrange")
        }
        
        static var grayColor: Color {
            return Color("ColorGray")
        }
        
        static var blueColor: Color {
            return Color("ColorBlue")
        }
        
        static var lightgrayColor: Color {
            return Color("ColorLightGray")
        }
        
        static var beigeColor: Color {
            return Color("ColorBeige")
        }
        
        
        // MARK: - 다이어리 노트색상
        static var lightYellowColor: Color {
            return Color("ColorLightYellow")
        }
        
        static var lightOrangeColor: Color {
            return Color("ColorLightOrange")
        }
        
        static var skyBlueColor: Color {
            return Color("ColorSkyBlue")
        }
        
        static var salmonPinkColor: Color {
            return Color("ColorSalmonPink")
        }
        
        static var turquoiseColor: Color {
            return Color("ColorTurquoise")
        }
        
        static var lightPurpleColor: Color {
            return Color("ColorLightPurple")
        }
        
        
        // MARK: - 폰트색상
        static var fontLightgrayColor: Color {
            return Color("FontColorLightGray")
        }
        
        static var fontDarkgrayColor: Color {
            return Color("FontColorDarkGray")
        }
        
        static var fontNavyColor: Color {
            return Color("FontColorNavy")
        }
    }
}


// MARK: - PlaceHolderText Color
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}



//extension View {
//    
//    func getRect() -> CGRect {
//        #if os(iOS)
//        return UIScreen.main.bounds
//        #else
//        return NSScreen.
//    }
//}
