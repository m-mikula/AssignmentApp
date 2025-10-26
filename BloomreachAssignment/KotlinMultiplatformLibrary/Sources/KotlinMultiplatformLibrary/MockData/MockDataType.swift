//
//  MockDataType.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 25/10/2025.
//

import Foundation

public enum MockDataType: String {
    /**
     The imageData property in JSON file contains imageData.base64EncodedString() of compressed JPEG image from defaul iOS simulator gallery.
     */
    case formDataImageBackground
    case formDataColorBackground
    
    public var fileName: String {
        switch self {
        case .formDataImageBackground: return "FormDataImageBackground"
        case .formDataColorBackground: return "FormDataColorBackground"
        }
    }
    
    public var data: Data? {
        guard let url = Bundle.module.url(forResource: self.fileName, withExtension: "json") else { return nil }
        return try? Data(contentsOf: url)
    }
}
