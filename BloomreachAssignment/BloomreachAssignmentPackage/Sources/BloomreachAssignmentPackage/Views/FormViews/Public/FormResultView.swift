//
//  FormResultView.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 23/10/2025.
//

import KotlinMultiplatformLibrary
import SwiftUI

public struct FormResultView: View {
    @State public var viewModel: FormResultViewModel
    
    public init(viewModel: FormResultViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            if let formViewModel = viewModel.formViewModel {
                FormView(viewModel: formViewModel)
                    .alert("Error", isPresented: $viewModel.isShowingErrorAlert, actions: {
                        Button("OK", role: .cancel) {}
                    }, message: {
                        Text(viewModel.errorMessage)
                    })
                    .alert("Success", isPresented: $viewModel.isShowingSuccessAlert, actions: {
                        Button("OK", role: .cancel) {}
                    }, message: {
                        Text(viewModel.successMessage)
                    })
            } else if !viewModel.errorMessage.isEmpty {
                NoDataView(message: viewModel.errorMessage) {
                    loadData()
                }
            }

            if viewModel.isLoadingData {
                LoadingView(title: "Loading...")
            }
        }
        .task {
            loadData()
        }
    }
}

private extension FormResultView {
    func loadData() {
        Task {
            await viewModel.loadData()
        }
    }
}

#Preview {
    FormResultView(viewModel: FormResultViewModel(dataSourceType: .mockData(.formDataColorBackground)))
}
