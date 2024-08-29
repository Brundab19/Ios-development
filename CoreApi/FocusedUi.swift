//
//  FocusedUi.swift
//  CoreApi
//
//  Created by Brunda Basavarajappa on 17/07/24.
//

import SwiftUI

struct FocusedUi: View {
    enum Field: Hashable {
        case username
        case password
    }

    @FocusState private var focusedField: Field?
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                // Perform login action
            }
            .padding()
        }
        .padding()
        .onAppear {
            // Automatically focus the username field when the view appears
            focusedField = .username
        }
        .onChange(of: focusedField) { newField in
            // Handle changes in focus if needed
            print("Focused field: \(String(describing: newField))")
        }
    }
}


