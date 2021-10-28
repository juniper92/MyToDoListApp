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
