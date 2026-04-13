//
//  PlaylistView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct PlaylistView: View {
    var favoriteTitles: [String]

    var body: some View {
        List(sampleSongs, id: \.self) { song in
            SongRow(
                song: song
            )
        }
    }

}
