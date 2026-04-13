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

    @State private var isPlaying: Bool = false
    @State private var showLyricsSheet: Bool = false
    @State private var progress: Double = 0.35

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
                Slider(value: $progress, in: 0...1)
                    .tint(.indigo)
                HStack {
                    Text(elapsedTime())
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("00:00")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)

            // Playback controls
            HStack(spacing: 40) {
                Button(action: previousTrack) {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                }
                Button(action: togglePlay) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.indigo)
                }
                Button(action: nextTrack) {
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

                Button(action: { showLyricsSheet = true }) {
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
        .sheet(isPresented: $showLyricsSheet) {
            LyricsSheetView(title: song, artist: "")
        }
    }

    func togglePlay() {
        isPlaying.toggle()
    }

    func previousTrack() {
        progress = max(0, progress - 0.1)
    }

    func nextTrack() {
        progress = min(1, progress + 0.1)
    }

    func elapsedTime() -> String {
//        // Parse duration mm:ss and multiply by progress
//        let parts = duration.split(separator: ":").compactMap { Int($0) }
//        guard parts.count == 2 else { return "0:00" }
//        let totalSeconds = parts[0] * 60 + parts[1]
//        let elapsed = Int(Double(totalSeconds) * progress)
//        return String(format: "%d:%02d", elapsed / 60, elapsed % 60)
        return "00:00"
    }
}
