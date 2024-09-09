//
//  MoviesViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 20.08.2024.
//

import Foundation

@MainActor
final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func loadMovies(for category: MovieCategory) async {
        do {
            let movieResponse: MovieResponse = try await NetworkManager.shared.request(from: "movie/\(category.rawValue)", as: MovieResponse.self)
            self.movies = movieResponse.results
        } catch {
            print("Failed to load movies: \(error)")
        }
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
