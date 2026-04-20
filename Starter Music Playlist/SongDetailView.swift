//
//  SongDetailView.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct SongDetailView: View {
    // MARK: Properties / variables
    
    @State var progress: Double = 0.5
    @State var isPlaying: Bool = true
    
    // Step 3 - Prepare variables / data that will be passed from previous view
    @State var selectedSongIndex: Int
    var songTitles: [String]
    
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
                Text(songTitles[selectedSongIndex])
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
                    // Step 6: call the functions
                   skipBackward()
                }) {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                }
                
                Button(action: {
                    if isPlaying {
                        pauseSong()
                    } else {
                        playSong()
                    }
                }) {
                    if isPlaying {
                        Image(systemName: "pause.circle.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.indigo)
                    } else {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.indigo)
                    }
                }
                
                Button(action: {
                    skipForward()
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
    
    // Step 5 - Define all functions can be performed in this view
    func playSong() {
        isPlaying = true
    }
    
    func pauseSong() {
        isPlaying = false
    }
    
    func skipForward() {
        if progress < 1 {
            progress += 0.1
        }
        checkProgress()
    }
    
    func skipBackward() {
        if progress > 0 {
            progress -= 0.1
        }
        checkProgress()
    }
    
    func checkProgress() {
        if progress >= 1 && canPlayNextSong() {
            playNextSong()
        } else if progress <= 0 && selectedSongIndex > 0 {
            playPrevSong()
        }
    }
    
    func canPlayNextSong() -> Bool {
        return selectedSongIndex < songTitles.count - 1
    }
    
    func canPlayPrevSong() -> Bool {
        return selectedSongIndex > 0
    }
    
    func playPrevSong() {
        selectedSongIndex -= 1
        progress = 0
    }
    
    func playNextSong() {
        selectedSongIndex += 1
        progress = 0
    }
    
}

#Preview {
    SongDetailView(progress: 0,
                   isPlaying: true,
                   selectedSongIndex: 0,
                   songTitles: ["Song Title - 1", "Song Title - 2"])
}
