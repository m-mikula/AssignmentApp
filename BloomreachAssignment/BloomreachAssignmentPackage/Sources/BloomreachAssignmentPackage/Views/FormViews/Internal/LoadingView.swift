//
//  LoadingView.swift
//  BloomreachAssignmentPackage
//
//  Created by Martin Mikula on 23/10/2025.
//

import SwiftUI

struct LoadingView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        ProgressView(title)
            .frame(width: 150, height: 100)
            .background(.gray)
            .scaleEffect(1.7)
            .font(.caption)
            .foregroundStyle(.white)
            .tint(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 2)
    }
}

#Preview {
    LoadingView(title: "Loading...")
}
