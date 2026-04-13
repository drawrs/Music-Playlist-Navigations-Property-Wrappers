//
//  SongDetailView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct SongDetailView: View {
    let song: String

    var isPlaying: Bool = false
    var showLyricsSheet: Bool = false
    var progress: Double = 0.35

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
            Button(action: {
                
            }) {
                Label(
                    "Favorite",
                    systemImage: "heart"
                )
                .foregroundStyle(.gray)
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
    }

}

#Preview {
    SongDetailView(song: "Hi there!")
}
