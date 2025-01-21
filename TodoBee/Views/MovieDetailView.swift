//
//  MovieDetailView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 20.08.2024.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text("Release Date: \(movie.releaseDate)")
                    Spacer()
                    Text("Language: \(movie.originalLanguage.uppercased())")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                HStack {
                    Text("Rating: \(movie.voteAverage, specifier: "%.1f")/10")
                    Spacer()
                    Text("Votes: \(movie.voteCount)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Text("Overview")
                    .font(.headline)
                    .padding(.top)
                
                Text(movie.overview)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Movie Details")
    }
}
