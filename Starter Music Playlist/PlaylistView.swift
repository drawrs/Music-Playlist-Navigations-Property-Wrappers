//
//  PlaylistView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct PlaylistView: View {
    // MARK: Properties / variables
    
    // Step 1 - Define data collections - Array of Songs
    @State var songTitles: [String] = [
        "Bohemian Rhapsody - Queen",
        "Hotel CaliforniaEagles - Eagles",
        "Stairway to Heaven - Led Zeppelin"
    ]
    
    // MARK: View body
    var body: some View {
        NavigationStack {
            List {
                // Step 2 - Loop collections data & display view that want to be iterated
                // Loop songTitles into SongRow
                ForEach(songTitles.indices, id: \.self) { songIndex in
                    NavigationLink {
                        
                        // Step 4 - Passing the variables / data needed
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
    
    func testAt(){
        (["Hello", "Hi"]).forEach { _ in
            print("Hello")
        }
    }
}

#Preview {
    PlaylistView()
}
