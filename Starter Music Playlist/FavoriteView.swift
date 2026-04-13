//
//  FavoriteView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct FavoriteView: View {
    var favoriteTitles: [String]

    var favoriteSongs: [String] {
        sampleSongs.filter { favoriteTitles.contains($0) }
    }

    var body: some View {
        Group {
            if favoriteSongs.isEmpty {
                ContentUnavailableView(
                    "No Favorites Yet",
                    systemImage: "heart.slash",
                    description: Text("Go to the Playlist tab and heart a song.")
                )
            } else {
                List {
                    ForEach(favoriteSongs, id: \.self) { song in
                        SongRow(song: song)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                // Remove favorite
                            } label: {
                                Label("Remove", systemImage: "heart.slash")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Favorites")
    }

}
