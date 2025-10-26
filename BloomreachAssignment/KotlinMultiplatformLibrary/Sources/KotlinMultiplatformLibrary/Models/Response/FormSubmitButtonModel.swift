//
//  FormSubmitButtonModel.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 22/10/2025.
//

import Foundation

public struct FormSubmitButtonModel: Decodable {
    public let titleTextAttributes: FormTextAttributesModel
    
    public init(
        titleTextAttributes: FormTextAttributesModel
    ) {
        self.titleTextAttributes = titleTextAttributes
    }
}
