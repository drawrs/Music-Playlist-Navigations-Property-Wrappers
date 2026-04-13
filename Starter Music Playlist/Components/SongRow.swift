//
//  SongRow.swift
//  Sample Property Wraper and Navigations
//
//  Created by Rizal Hilman on 13/04/26.
//
import SwiftUI

struct SongRow: View {
    let song: String

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.indigo.opacity(0.12))
                    .frame(width: 44, height: 44)
                Image(systemName: "music.note")
                    .foregroundStyle(.indigo)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(song)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(1)
//                Text(artist)
//                    .font(.caption)
//                    .foregroundStyle(.secondary)
//                    .lineLimit(1)
            }

            Spacer()

            if false {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .font(.caption)
            }

            Text("00:00")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
