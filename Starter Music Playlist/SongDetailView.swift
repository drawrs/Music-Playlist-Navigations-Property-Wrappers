//
//  SongDetailView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct SongDetailView: View {
    let song: String
    let isFavorite: Bool
    let onToggleFavorite: () -> Void

    private var isPlaying: Bool = false
    private var showLyricsSheet: Bool = false
    private var progress: Double = 0.35

    var body: some View {
        VStack(spacing: 24) {
            // Album art
            ZStack {
                Circle()
                    .fill(Color.indigo.opacity(0.15))
                    .frame(width: 200, height: 200)
                Image(systemName: "music.note")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .foregroundStyle(.indigo)
            }
            .padding(.top, 16)

            // Song info
            VStack(spacing: 4) {
                Text(song)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }

            // Progress bar
            VStack(spacing: 4) {
                Slider(value: .constant(0), in: 0...1)
                    .tint(.indigo)
                HStack {
                    Text("00:00")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("03:00")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)

            // Playback controls
            HStack(spacing: 40) {
                Button(action: {
                    // previous track
                }) {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                }
                Button(action: {
                    // toggle play
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.indigo)
                }
                Button(action: {
                    // next track
                }) {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                }
            }
            .foregroundStyle(.primary)

            // Favorite + Lyrics buttons
            HStack(spacing: 32) {
                Button(action: onToggleFavorite) {
                    Label(
                        isFavorite ? "Unfavorite" : "Favorite",
                        systemImage: isFavorite ? "heart.fill" : "heart"
                    )
                    .foregroundStyle(isFavorite ? .red : .gray)
                }

                Button(action: {
                    // show lyric sheet
                }) {
                    Label("Lyrics", systemImage: "text.quote")
                        .foregroundStyle(.indigo)
                }
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
        .navigationTitle("Now Playing")
        .navigationBarTitleDisplayMode(.inline)
    }

}
