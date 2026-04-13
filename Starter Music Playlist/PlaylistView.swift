//
//  PlaylistView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct PlaylistView: View {
    // MARK: Properties / variables
    
    // MARK: View body
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    SongDetailView(song: "Bohemian Rhapsody - Queen")
                } label: {
                    SongRow(
                        song: "Bohemian Rhapsody - Queen"
                    )
                }
                
                NavigationLink {
                    SongDetailView(song: "Hotel CaliforniaEagles - Eagles")
                } label: {
                    SongRow(
                        song: "Hotel CaliforniaEagles - Eagles"
                    )
                }
                
                NavigationLink {
                    SongDetailView(song: "Stairway to Heaven - Led Zeppelin")
                } label: {
                    SongRow(
                        song: "Stairway to Heaven - Led Zeppelin"
                    )
                }
            }
            .navigationTitle("Playlist")
        }
    }

}


#Preview {
    PlaylistView()
}
