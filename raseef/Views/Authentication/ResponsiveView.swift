//
//  ResponsiveView.swift
//  raseef
//
//  Created by Teamx tec on 18/10/2022.
//

import Foundation
import SwiftUI

struct Properties{
    
    var isLandscape: Bool
    var isiPad: Bool
    var isSplit: Bool
    var isMaxSplit: Bool
    var size: CGSize
    
}
struct ResponsiveView<Content: View>: View {
    var content: (Properties)->Content
    init(@ViewBuilder content: @escaping (Properties) -> Content)
    {
        self.content = content
        
    }
    var body: some View{
        GeometryReader
        {proxy in
            let size = proxy.size
            let isLandscape = size.width > size.height
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            let isMaxSplit = isSplit() && size.width < 400
            let properties = Properties(isLandscape: isLandscape, isiPad: isIpad, isSplit: isSplit(), isMaxSplit: isMaxSplit, size: size)
            content(properties)
                .frame(width: size.width, height: size.height)
            
        }
        
    }
    
    func isSplit() -> Bool{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else{return false}
        return screen.windows.first?.frame.size != screen.screen.bounds.size
        
    }
}
