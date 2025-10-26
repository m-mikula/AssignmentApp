//
//  FormBackgroundViewModel.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 23/10/2025.
//

import Foundation
import KotlinMultiplatformLibrary
import SwiftUI

public struct FormBackgroundViewModel {
    public let color: Color?
    public let image: Image?
    
    public init(
        colorHexString: String? = nil,
        imageString: String? = nil
    ) {
        if let colorHex = colorHexString {
            self.color = Color(hex: colorHex)
        } else {
            self.color = nil
        }
        
        if let imageString = imageString, let imageData = Data(base64Encoded: imageString), let uiImage = UIImage(data: imageData) {
            self.image = Image(uiImage: uiImage)
        } else {
            self.image = nil
        }
    }
}

public extension KotlinMultiplatformLibrary.FormBackgroundModel {
    var formBackgroundViewModel: FormBackgroundViewModel {
        FormBackgroundViewModel(colorHexString: colorHex, imageString: imageData)
    }
}
