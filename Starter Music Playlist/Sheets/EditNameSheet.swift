//
//  EditNameSheet.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct EditNameSheet: View {

    var body: some View {
        Form {
            Section("Your Name") {
                TextField("Name", text: .constant(""))
            }
        }
        .navigationTitle("Edit Name")
        .navigationBarTitleDisplayMode(.inline)
    }
}
