//
//  FormView.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 22/10/2025.
//

import SwiftUI

struct FormView: View {
    @State var viewModel: FormViewModel
    
    var body: some View {
        if let backgroundImage = viewModel.formBackgroundViewModel.image {
            scrollFormView
                .background(
                    backgroundImage
                        .resizable()
                        .ignoresSafeArea(.all)
                        .scaledToFill()
                )
        } else if let backgroundColor = viewModel.formBackgroundViewModel.color {
            scrollFormView
                .background(backgroundColor)
        } else {
            scrollFormView
        }
    }
}

private extension FormView {
    var scrollFormView: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.formTextFieldsViewModel, id: \.id) { formTextFieldViewModel in
                        FormTextField(viewModel: formTextFieldViewModel)
                    }
                }

                FormSubmitButton(viewModel: viewModel.formSubmitButtonViewModel)
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var viewModel = FormViewModel(
        formTextFieldsViewModel: [
            FormTextFieldViewModel(
                id: "",
                titleTextAttributes: FormTextAttributesViewModel(text: "First input", fontSize: 10, fontColorHex: "#8E8E93"),
                placeholderTextAttributes: FormTextAttributesViewModel(text: "Placeholder 1", fontSize: 14, fontColorHex: "#000000")
            )
        ],
        formSubmitButtonViewModel: FormSubmitButtonViewModel(
            titleTextAttributes: FormTextAttributesViewModel(text: "Submit form", fontSize: 17, fontColorHex: "#FFFFFF"),
        ),
        formBackgroundViewModel: FormBackgroundViewModel(colorHexString: "#A52A2A0D")
    )
    
    FormView(viewModel: viewModel)
        .padding()
}
