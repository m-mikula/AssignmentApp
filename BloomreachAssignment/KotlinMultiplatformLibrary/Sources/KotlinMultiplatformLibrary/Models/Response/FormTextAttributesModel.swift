//
//  FormTextAttributesModel.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 25/10/2025.
//

import Foundation

public struct FormTextAttributesModel: Decodable {
    public let text: String
    public let fontSize: Int
    public let fontColorHex: String
    
    public init(
        text: String,
        fontSize: Int,
        fontColorHex: String
    ) {
        self.text = text
        self.fontSize = fontSize
        self.fontColorHex = fontColorHex
    }
}
