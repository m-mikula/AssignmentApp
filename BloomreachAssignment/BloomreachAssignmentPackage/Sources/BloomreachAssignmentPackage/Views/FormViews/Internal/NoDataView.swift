//
//  NoDataView.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 23/10/2025.
//

import SwiftUI

struct NoDataView: View {
    private let message: String
    private let action: () -> ()
    
    init(
        message: String,
        action: @escaping () -> Void
    ) {
        self.message = message
        self.action = action
    }
    
    var body: some View {
        ContentUnavailableView {
            Label("No data", systemImage: "exclamationmark.triangle")
        } description: {
            VStack(alignment: .center) {
                Text(message)
                Text("Please try again later.")
            }
        } actions: {
            Button("Try again") {
                action()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    NoDataView(
        message: "Failed to load data",
        action: {
            debugPrint("Try again button tapped")
        }
    )
}
