//
//  ContentView.swift
//  BloomreachAssignmentApp
//
//  Created by Martin Mikula on 22/10/2025.
//

import BloomreachAssignmentPackage
import SwiftUI

struct ContentView: View {
    var body: some View {
        FormResultView(viewModel: FormResultViewModel(dataSourceType: .mockData(.formDataImageBackground)))
    }
}

#Preview {
    ContentView()
}
