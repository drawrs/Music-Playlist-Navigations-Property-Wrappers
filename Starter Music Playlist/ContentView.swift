//
//  ContentView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//

import SwiftUI

// Array
let sampleSongs: [String] = [
    "Bohemian Rhapsody - Queen",
    "Hotel California - Eagles",
    "Stairway to Heaven - Led Zeppelin",
    "Smells Like Teen Spirit - Nirvana",
    "Billie Jean - Michael Jackson",
    "Shape of You - Ed Sheeran",
    "Blinding Lights - The Weeknd",
]

struct MainTabView: View {
    
    @State private var favoriteSongs: [String] = []

    var body: some View {
        TabView {
            PlaylistView(favoriteTitles: $favoriteSongs)
                .tabItem {
                    Label("Playlist", systemImage: "music.note.list")
                }

            FavoriteView(favoriteTitles: $favoriteSongs)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
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
