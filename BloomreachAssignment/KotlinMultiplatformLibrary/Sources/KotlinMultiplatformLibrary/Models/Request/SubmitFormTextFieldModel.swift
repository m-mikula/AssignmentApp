//
//  SubmitFormTextFieldModel.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 26/10/2025.
//

import Foundation

public struct SubmitFormTextFieldModel {
    public let id: String
    public let value: String
    
    public init(
        id: String,
        value: String
    ) {
        self.id = id
        self.value = value
    }
}
