//
//  ProfileView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct ProfileView: View {
    // MARK: Properties / variables
    @State var isEditingSheetPresented: Bool = false
    @State var fullName: String = "John Doe"
    
    // MARK: View body
    var body: some View {
        List {
            // Avatar + name
            Section {
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.indigo.opacity(0.2))
                            .frame(width: 64, height: 64)
                        Text("JD")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.indigo)
                    }
                    VStack(alignment: .leading, spacing: 2) {
                        Text(fullName)
                            .font(.headline)
                        Text("Music Lover")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 8)
            }

            // Settings
            Section("Settings") {
                Button {
                    isEditingSheetPresented = true
                } label: {
                    Label("Edit Name", systemImage: "pencil")
                }
                .sheet(isPresented: $isEditingSheetPresented) {
                    EditNameSheet(fullName: $fullName,
                                  isPresented: $isEditingSheetPresented)
                }
                
                Button(role: .destructive) {
                    fullName = "Guest"
                } label: {
                    Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
