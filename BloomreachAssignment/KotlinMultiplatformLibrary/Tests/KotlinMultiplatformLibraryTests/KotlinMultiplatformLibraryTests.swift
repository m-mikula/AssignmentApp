import Foundation
import Testing
@testable import KotlinMultiplatformLibrary

extension Tag {
    enum data_storage {}
}

extension Tag.data_storage {
    @Tag static var mock: Tag
    @Tag static var network: Tag
}

@Suite("Mock data") struct MockDataTests {
    
    @Test("Test text fields count", .tags(.data_storage.mock)) func textFieldsCount() async throws {
        let dataManager = DataManager()
        dataManager.fetchFormData(from: .mockData(.formDataImageBackground)) { result in
            switch result {
            case .success(let mockData):
                #expect(mockData.formTextFields.count == 5, "Error: incorrect mock data.")
            case .failure(let error):
                Issue.record(error, "Test should not fail.")
            }
        }
    }
}
