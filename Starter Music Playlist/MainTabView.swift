//
//  MainTabView.swift
//  Starter Music Playlist
//
//  Created by Rizal Hilman on 13/04/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            PlaylistView()
                .tabItem {
                    Label("Playlist", systemImage: "music.note.list")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
}
