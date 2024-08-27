//
//  TVSeriesDetailView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 27.08.2024.
//

import SwiftUI

struct TVSeriesDetailView: View {
    let tvSeries: TVSeries
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: tvSeries.posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                
                Text(tvSeries.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text("First Air Date: \(tvSeries.firstAirDate)")
                    Spacer()
                    Text("Language: \(tvSeries.originalLanguage.uppercased())")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                HStack {
                    Text("Rating: \(tvSeries.voteAverage, specifier: "%.1f")/10")
                    Spacer()
                    Text("Votes: \(tvSeries.voteCount)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Text("Overview")
                    .font(.headline)
                    .padding(.top)
                
                Text(tvSeries.overview)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("TV Series Details")
    }
}
