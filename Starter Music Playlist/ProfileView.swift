//
//  ProfileView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct ProfileView: View {
    @State private var username: String = "Rizal Hilman"
    @State private var isEditingName: Bool = false
    @State private var showLogoutSheet: Bool = false

    private let stats: [(label: String, value: String)] = [
        ("Songs",     "\(sampleSongs.count)"),
        ("Playlists", "3"),
        ("Following", "12"),
    ]

    var body: some View {
        NavigationStack {
            List {
                // Avatar + name
                Section {
                    HStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(Color.indigo.opacity(0.2))
                                .frame(width: 64, height: 64)
                            Text(initials())
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.indigo)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text(username)
                                .font(.headline)
                            Text("Music Lover")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }

                // Stats
                Section("Stats") {
                    HStack {
                        ForEach(stats, id: \.label) { stat in
                            VStack {
                                Text(stat.value)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text(stat.label)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.vertical, 4)
                }

                // Settings
                Section("Settings") {
                    Button {
                        isEditingName = true
                    } label: {
                        Label("Edit Name", systemImage: "pencil")
                    }

                    Button(role: .destructive) {
                        showLogoutSheet = true
                    } label: {
                        Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                }
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $isEditingName) {
                EditNameSheet(username: $username)
            }
            .sheet(isPresented: $showLogoutSheet) {
                LogoutSheet(onLogout: handleLogout)
            }
        }
    }

    func initials() -> String {
        let parts = username.split(separator: " ")
        return parts.compactMap { $0.first }.map(String.init).joined()
    }

    func handleLogout() {
        showLogoutSheet = false
        username = "Guest"
    }
}
