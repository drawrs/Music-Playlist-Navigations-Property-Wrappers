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
        List {
            SongRow(
                song: "Bohemian Rhapsody - Queen"
            )
            
            SongRow(
                song: "Hotel CaliforniaEagles - Eagles"
            )
            
            SongRow(
                song: "Stairway to Heaven - Led Zeppelin"
            )
        }
    }

}


#Preview {
    PlaylistView()
}
