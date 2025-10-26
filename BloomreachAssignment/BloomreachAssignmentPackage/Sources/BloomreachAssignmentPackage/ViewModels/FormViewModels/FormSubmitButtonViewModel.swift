//
//  FormSubmitButtonViewModel.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 22/10/2025.
//

import Foundation
import KotlinMultiplatformLibrary

public struct FormSubmitButtonViewModel {
    public let titleTextAttributes: FormTextAttributesViewModel
    public var action: (() -> ())?
    
    public init(
        titleTextAttributes: FormTextAttributesViewModel,
        action: (() -> ())? = nil
    ) {
        self.titleTextAttributes = titleTextAttributes
        self.action = action
    }
}

public extension KotlinMultiplatformLibrary.FormSubmitButtonModel {
    var formSubmitButtonViewModel: FormSubmitButtonViewModel {
        FormSubmitButtonViewModel(titleTextAttributes: titleTextAttributes.formTextAttributesViewModel)
    }
}
