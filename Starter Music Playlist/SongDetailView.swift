//
//  SongDetailView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct SongDetailView: View {
    // MARK: Properties / variables
    var song: String
    @State var progress: Double = 0.5
    @State var isPlaying: Bool = true
    
    // MARK: View body
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
                    progress -= 0.1
                }) {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                }
                Button(action: {
                    // toggle play
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.indigo)
                }
                Button(action: {
                    // next track
                    progress += 0.1
                }) {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                }
            }
            .foregroundStyle(.primary)


            Spacer()
        }
        .padding()
    }

}

#Preview {
    SongDetailView(song: "Song Title - Artist Name")
}
