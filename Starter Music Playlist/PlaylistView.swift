//
//  PlaylistView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct PlaylistView: View {
    @Binding var favoriteTitles: [String]

    var body: some View {
        NavigationStack {
            List(sampleSongs, id: \.self) { song in
                NavigationLink(value: song) {
                    SongRow(
                        song: song
                    )
                }
            }
            .navigationTitle("My Playlist")
            .navigationDestination(for: String.self) { song in
                if let song = sampleSongs.first(where: { $0 == song }) {
                    SongDetailView(
                        song: song,
                        isFavorite: isFavorite(song),
                        onToggleFavorite: { toggleFavorite(song) }
                    )
                }
            }
        }
    }

    func isFavorite(_ title: String) -> Bool {
        favoriteTitles.contains(title)
    }

    func toggleFavorite(_ title: String) {
        if let index = favoriteTitles.firstIndex(of: title) {
            favoriteTitles.remove(at: index)
        } else {
            favoriteTitles.append(title)
        }
    }
}
