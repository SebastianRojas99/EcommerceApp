//
//  DismissButton.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 25/04/2024.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button{
            dismiss()
        }label: {
            Image(systemName: "arrow.left")
                .imageScale(.large)
                .padding()
                .frame(width: 70,height: 90)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
        }
    }
}
