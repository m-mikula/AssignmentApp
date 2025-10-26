//
//  FormTextAttributesViewModel.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 25/10/2025.
//

import KotlinMultiplatformLibrary
import SwiftUI

public struct FormTextAttributesViewModel {
    public let text: String
    public let fontSize: CGFloat
    public let fontColor: Color
    
    public init(
        text: String,
        fontSize: Int,
        fontColorHex: String
    ) {
        self.text = text
        self.fontSize = CGFloat(integerLiteral: fontSize)
        self.fontColor = Color(hex: fontColorHex) ?? .primary
    }
}

public extension KotlinMultiplatformLibrary.FormTextAttributesModel {
    var formTextAttributesViewModel: FormTextAttributesViewModel {
        FormTextAttributesViewModel(text: text, fontSize: fontSize, fontColorHex: fontColorHex)
    }
}
