//
//  FormSubmitButton.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 22/10/2025.
//

import SwiftUI

struct FormSubmitButton: View {
    let viewModel: FormSubmitButtonViewModel
    
    var body: some View {
        Button {
            viewModel.action?()
        } label: {
            Text(viewModel.titleTextAttributes.text)
                .padding(.all, 8)
                .frame(maxWidth: .infinity)
                .font(.system(size: viewModel.titleTextAttributes.fontSize))
        }
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.mint)
        )
        .tint(viewModel.titleTextAttributes.fontColor)
    }
}

#Preview {
    let viewModel = FormSubmitButtonViewModel(
        titleTextAttributes: FormTextAttributesViewModel(text: "Submit", fontSize: 17, fontColorHex: "#FFFFFF"),
        action: {
            debugPrint("FormSubmitButton pressed")
        }
    )
    
    FormSubmitButton(viewModel: viewModel)
        .padding()
}
