//
//  FormTextFieldModel.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 22/10/2025.
//

import Foundation

public struct FormTextFieldModel: Decodable {
    public let id: String
    public let titleTextAttributes: FormTextAttributesModel
    public let placeholderTextAttributes: FormTextAttributesModel
    
    public init(
        id: String,
        titleTextAttributes: FormTextAttributesModel,
        placeholderTextAttributes: FormTextAttributesModel
    ) {
        self.id = id
        self.titleTextAttributes = titleTextAttributes
        self.placeholderTextAttributes = placeholderTextAttributes
    }
    
    public enum CodingKeys: CodingKey {
        case id
        case titleTextAttributes
        case placeholderTextAttributes
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.titleTextAttributes = try container.decode(FormTextAttributesModel.self, forKey: .titleTextAttributes)
        self.placeholderTextAttributes = try container.decode(FormTextAttributesModel.self, forKey: .placeholderTextAttributes)
    }
}
