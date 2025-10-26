//
//  FormTextField.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 22/10/2025.
//

import SwiftUI

struct FormTextField: View {
    @Bindable var viewModel: FormTextFieldViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(viewModel.titleTextAttributes.text.uppercased())
                .padding(.leading, 12)
                .font(.system(size: viewModel.titleTextAttributes.fontSize))
                .foregroundStyle(viewModel.titleTextAttributes.fontColor)
            
            TextField(viewModel.placeholderTextAttributes.text, text: $viewModel.text)
                .tint(.gray)
                .font(.system(size: viewModel.placeholderTextAttributes.fontSize, weight: .light))
                .foregroundStyle(viewModel.placeholderTextAttributes.fontColor)
                .autocorrectionDisabled(true)
                .keyboardType(.asciiCapable)
                .padding(.all, 12)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    @Previewable @State var viewModel = FormTextFieldViewModel(
        id: "",
        titleTextAttributes: FormTextAttributesViewModel(text: "First input", fontSize: 10, fontColorHex: "#8E8E93"),
        placeholderTextAttributes: FormTextAttributesViewModel(text: "Placeholder 1", fontSize: 14, fontColorHex: "#000000")
    )
    
    FormTextField(viewModel: viewModel)
        .padding()
}
