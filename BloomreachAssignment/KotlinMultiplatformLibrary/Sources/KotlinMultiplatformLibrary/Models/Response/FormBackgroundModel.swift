//
//  FormBackgroundModel.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 23/10/2025.
//

import Foundation

public struct FormBackgroundModel: Decodable {
    public let colorHex: String?
    public let imageData: String?
    
    public init(
        colorHex: String?,
        imageData: String?
    ) {
        self.colorHex = colorHex
        self.imageData = imageData
    }
}
