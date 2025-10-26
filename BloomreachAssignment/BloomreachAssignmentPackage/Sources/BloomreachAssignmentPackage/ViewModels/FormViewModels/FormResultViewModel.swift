//
//  FormResultViewModel.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 25/10/2025.
//

import KotlinMultiplatformLibrary
import SwiftUI

@MainActor @Observable public final class FormResultViewModel {
    var formViewModel: FormViewModel?
    
    private(set) var successMessage = ""
    var isShowingSuccessAlert = false
    
    private(set) var errorMessage = ""
    var isShowingErrorAlert = false
    
    private(set) var isLoadingData = false
    private let dataSourceType: DataSourceType
    
    @ObservationIgnored private var dataManager = DataManager()
    
    public init(dataSourceType: DataSourceType = .network) {
        self.dataSourceType = dataSourceType
    }
    
    public func loadData() async {
        isLoadingData = true
        
        dataManager.fetchFormData(from: dataSourceType, completionHandler: { [weak self] result in
            switch result {
            case .success(let formModel):
                DispatchQueue.main.async {
                    self?.errorMessage = ""
                    self?.formViewModel = formModel.formViewModel
                    self?.prepareData()
                    self?.isLoadingData = false
                }
            case .failure(let error):
                self?.errorMessage = error.errorMessage
                self?.formViewModel = nil
                self?.isLoadingData = false
            }
        })
    }
}

private extension FormResultViewModel {
    func prepareData() {
        formViewModel?.formSubmitButtonViewModel.action = { [weak self] in
            self?.submitForm()
        }
    }
    
    func submitForm() {
        let submitFormModels: [SubmitFormTextFieldModel] = formViewModel?.formTextFieldsViewModel.compactMap { model in
            SubmitFormTextFieldModel(id: model.id, value: model.text)
        } ?? []
        
        dataManager.submitForm(submitFormModels: submitFormModels) { [weak self] result in
            self?.isLoadingData = false
            
            switch result {
            case .success:
                self?.successMessage = "Form submitted successfully!"
                self?.isShowingSuccessAlert = true
            case .failure(let error):
                self?.errorMessage = error.errorMessage
                self?.isShowingErrorAlert = true
            }
        }
    }
}
