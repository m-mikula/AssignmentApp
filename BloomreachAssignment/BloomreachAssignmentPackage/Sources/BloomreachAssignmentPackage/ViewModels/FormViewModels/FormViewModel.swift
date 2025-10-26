//
//  FormData.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 22/10/2025.
//

import Foundation
import KotlinMultiplatformLibrary

public struct FormViewModel {
    public let formTextFieldsViewModel: [FormTextFieldViewModel]
    public var formSubmitButtonViewModel: FormSubmitButtonViewModel
    public let formBackgroundViewModel: FormBackgroundViewModel
    
    public init(
        formTextFieldsViewModel: [FormTextFieldViewModel],
        formSubmitButtonViewModel: FormSubmitButtonViewModel,
        formBackgroundViewModel: FormBackgroundViewModel
    ) {
        self.formTextFieldsViewModel = formTextFieldsViewModel
        self.formSubmitButtonViewModel = formSubmitButtonViewModel
        self.formBackgroundViewModel = formBackgroundViewModel
    }
}

public extension KotlinMultiplatformLibrary.FormModel {
    var formViewModel: FormViewModel {
        FormViewModel(
            formTextFieldsViewModel: formTextFields.map { model in
                model.formTextFieldViewModel
            },
            formSubmitButtonViewModel: formSubmitButton.formSubmitButtonViewModel,
            formBackgroundViewModel: formBackground.formBackgroundViewModel
        )
    }
}
