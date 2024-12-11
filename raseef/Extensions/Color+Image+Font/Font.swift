//
//  Fonts.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 20/05/2022.
//

import SwiftUI

extension Font {
    static func custom(helvitica: HelveticaFont, style: UIFont.TextStyle) -> Font {
        custom(helvitica.rawValue, size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }
    
    static func custom(opensans: OpensansFont, style: UIFont.TextStyle) -> Font {
        custom(opensans.rawValue, size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }
}

enum HelveticaFont: String {
    case bold = "Helvetica-Bold"
    case boldOblique = "Helvetica-BoldOblique"
    case medium = "helvetica-compressed-5871d14b6903a"
    case lightItalic = "helvetica-light-587ebe5a59211"
    case Oblique = "Helvetica-Oblique"
    case boldRound = "helvetica-rounded-bold-5871d05ead8de"
    case helvetica = "Helvetica"
    
 
    
}

enum OpensansFont: String {
    case italic1 = "OpenSans-Italic-VariableFont_wdth,wght"
    case italic2 = "OpenSans-VariableFont_wdth,wght"
    
}
