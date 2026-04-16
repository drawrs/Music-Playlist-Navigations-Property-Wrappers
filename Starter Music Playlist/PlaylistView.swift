//
//  PlaylistView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct PlaylistView: View {
    // MARK: Properties / variables
    @State var songTitles: [String] = [
        "Bohemian Rhapsody - Queen",
        "Hotel CaliforniaEagles - Eagles",
        "Stairway to Heaven - Led Zeppelin"
    ]
    
    // MARK: View body
    var body: some View {
        NavigationStack {
            List {
                ForEach(songTitles.indices, id: \.self) { songIndex in
                    NavigationLink {
                        SongDetailView(selectedSongIndex: songIndex,
                                       songTitles: songTitles)
                    } label: {
                        SongRow(
                            song: songTitles[songIndex]
                        )
                    }
                }
            }
            .navigationTitle("Playlist")
        }
    }
}

#Preview {
    PlaylistView()
}
