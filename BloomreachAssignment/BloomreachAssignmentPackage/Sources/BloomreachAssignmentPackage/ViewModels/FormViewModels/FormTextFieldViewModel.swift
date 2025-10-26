//
//  FormTextFieldViewModel.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 22/10/2025.
//

import Foundation
import KotlinMultiplatformLibrary
import SwiftUI

@Observable public final class FormTextFieldViewModel: Identifiable {
    public var text: String = ""
    
    public let id: String
    public let titleTextAttributes: FormTextAttributesViewModel
    public let placeholderTextAttributes: FormTextAttributesViewModel
    
    public init(
        id: String,
        titleTextAttributes: FormTextAttributesViewModel,
        placeholderTextAttributes: FormTextAttributesViewModel
    ) {
        self.id = id
        self.titleTextAttributes = titleTextAttributes
        self.placeholderTextAttributes = placeholderTextAttributes
    }
}

public extension KotlinMultiplatformLibrary.FormTextFieldModel {
    var formTextFieldViewModel: FormTextFieldViewModel {
        FormTextFieldViewModel(
            id: id,
            titleTextAttributes: titleTextAttributes.formTextAttributesViewModel,
            placeholderTextAttributes: placeholderTextAttributes.formTextAttributesViewModel
        )
    }
}
