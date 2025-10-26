//
//  DataManager.swift
//  KotlinMultiplatformLibrary
//
//  Created by Martin Mikula on 23/10/2025.
//

import Foundation

public enum DataSourceType {
    case network
    case mockData(MockDataType)
}

public enum DataManagerError: Error {
    case networkError
    case failedToLoadData
    case invalidFormData
    
    public var errorMessage: String {
        switch self {
        case .networkError:
            return "Network error"
        case .failedToLoadData:
            return "Failed to load data"
        case .invalidFormData:
            return "Invalid form data"
        }
    }
}

public final class DataManager {
    public init() {}
    
    /**
     Just for example, no real data.
     
     Using escaping closure to simulate async call and avoid concurrency warnings about non-sendable models.
     */
    public func fetchFormData(
        from dataSource: DataSourceType,
        completionHandler: @escaping ((Result<FormModel, DataManagerError>) -> ())
    ) {
        switch dataSource {
        case .network:
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) { // Pretend that this is heavy operation
                completionHandler(.failure(.networkError))
            }
        case .mockData(let mockDataType):
            if let data = mockDataType.data {
                do {
                    let result = try JSONDecoder().decode(FormModel.self, from: data)
                    
                    completionHandler(.success(result))
                } catch {
                    debugPrint(error.localizedDescription)
                    
                    completionHandler(.failure(.failedToLoadData))
                }
            } else {
                completionHandler(.failure(.failedToLoadData))
            }
        }
    }
    
    public func submitForm(
        submitFormModels: [SubmitFormTextFieldModel],
        completionHandler: @escaping ((Result<Void, DataManagerError>) -> ())
    ) {
        if submitFormModels.isEmpty {
            completionHandler(.failure(.invalidFormData))
        } else {
            // Send form data to API and handle response
            completionHandler(.success(()))
        }
    }
}
