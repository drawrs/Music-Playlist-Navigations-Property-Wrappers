//
//  LyricsSheetView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct LyricsSheetView: View {
    let title: String
    let artist: String

    // Dummy lyrics lines
    private let lines = [
        "🎵 This is a sample lyric line one",
        "    floating through the endless sky",
        "🎵 Another verse begins right here",
        "    as the melody carries on",
        "🎵 Chorus: La la la, sing along",
        "    feel the rhythm, feel the song",
        "🎵 Bridge leads us to the final note",
        "    and fades away into the night",
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    ForEach(lines, id: \.self) { line in
                        Text(line)
                            .font(.body)
                            .foregroundStyle(line.hasPrefix("🎵") ? .primary : .secondary)
                    }
                }
                .padding()
            }
            .navigationTitle("\(title) – Lyrics")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        
                    }
                }
            }
        }
    }
}
