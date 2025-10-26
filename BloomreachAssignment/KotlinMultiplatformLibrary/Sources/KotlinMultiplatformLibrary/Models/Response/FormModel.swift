//
//  FormModel.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 22/10/2025.
//

import Foundation

public struct FormModel: Decodable {
    public let formTextFields: [FormTextFieldModel]
    public let formSubmitButton: FormSubmitButtonModel
    public let formBackground: FormBackgroundModel
    
    public init(
        formTextFields: [FormTextFieldModel],
        formSubmitButton: FormSubmitButtonModel,
        formBackground: FormBackgroundModel
    ) {
        self.formTextFields = formTextFields
        self.formSubmitButton = formSubmitButton
        self.formBackground = formBackground
    }
}
